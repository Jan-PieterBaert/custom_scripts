import random
import string
import subprocess
import sys


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
