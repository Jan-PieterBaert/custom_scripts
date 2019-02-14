import random
import re
import string
import subprocess
import sys
from operator import attrgetter


def randomString(length):
    return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(length))


def writeToFile(lines, fileName):
    """
    Write lines to a file
    """
    tempFile = randomString(random.randint(12, 100))
    with open(tempFile, 'w+') as file:
        file.writelines(lines)
    subprocess.call("mv {} {}".format(tempFile, fileName), shell=True)


def query_yes_no(question, default="no"):
    """Ask a yes/no question via input() and return their answer.
    The "answer" return value is True for "yes" or False for "no".
    """
    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default.lower() == "yes":
        prompt = " [Y/n] "
    elif default.lower() == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: {}'".format(default))

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")


def findStartEnd(fileName, name):
    startIndex = 0
    endIndex = 0
    startWord = "<!-- {}Start -->".format(name)
    endWord = "<!-- {}End -->".format(name)
    with open(fileName) as file:
        i = 0
        for line in file:
            i += 1
            if re.match(startWord, line.rstrip("\n").strip(), flags=re.IGNORECASE):
                startIndex = i
            if re.match(endWord, line.rstrip("\n").strip(), flags=re.IGNORECASE):
                endIndex = i

    assert startIndex < endIndex

    return startIndex + 1, endIndex - 1


def getItems(fileName, className, kind, newWorkItems=None):
    """
    Get the workitems of a certain file, sorted by date, then course and then description.
    """
    newWorkItems = newWorkItems if newWorkItems is not None else list()
    startIndex, endIndex = findStartEnd(fileName, kind)
    lineFound = False
    i = 0
    with open(fileName) as file:
        for line in file:
            i += 1
            if i < startIndex + 1 or i > endIndex:
                continue

            if lineFound and len(line.strip()):
                newWorkItems.append(className(line))

            if re.sub("[|: -]*", "", line):
                lineFound = True
    return list(set(newWorkItems))


def fitTodosInFile(fileName, middle, name):
    """
    Fit the todos, listed as strings in middle
    """
    front = []
    back = ["\n"]
    i = 0
    startIndex, endIndex = findStartEnd(fileName, name)
    with open(fileName) as file:
        for line in file:
            if i <= startIndex:
                front.append(line)
            if i >= endIndex:
                back.append(line)
            i += 1
    return front + ["{}\n".format(a) for a in middle] + back


def editFileRemove(fileName, indices, items, name):
    """
    Edit a file with a deletion of todoItems (indices listed in indices parameter
    """
    indices = set(indices if indices else range(len(items)))
    removed = 0
    for index in indices:
        removedWorkItem = items[index - removed]
        if query_yes_no("Sure you want to remove {}".format(removedWorkItem), default="no"):
            items.remove(removedWorkItem)
            removed += 1
    return fitTodosInFile(fileName, items, name)


def editFileAdd(fileName, newElement, name):
    """
    Edit a file with an addition of a new todoItem
    """
    return fitTodosInFile(fileName, newElement, name)
