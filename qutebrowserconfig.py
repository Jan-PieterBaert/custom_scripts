# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['always']

# Which Chromium process model to use. Alternative process models use
# less resources, but decrease security and robustness. See the
# following pages for more details:    -
# https://www.chromium.org/developers/design-documents/process-models
# - https://doc.qt.io/qt-5/qtwebengine-features.html#process-models
# Type: String
# Valid values:
#   - process-per-site-instance: Pages from separate sites are put into separate processes and separate visits to the same site are also isolated.
#   - process-per-site: Pages from separate sites are put into separate processes. Unlike Process per Site Instance, all visits to the same site will share an OS process. The benefit of this model is reduced memory consumption, because more web pages will share processes. The drawbacks include reduced security, robustness, and responsiveness.
#   - single-process: Run all tabs in a single process. This should be used for debugging purposes only, and it disables `:open --private`.
c.qt.process_model = 'process-per-site-instance'

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Automatically start playing `<video>` elements. Note: On Qt < 5.11,
# this option needs a restart and does not support URL patterns.
# Type: Bool
c.content.autoplay = False

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Enable plugins in Web pages.
# Type: Bool
c.content.plugins = True

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = -1

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '40%'

# Minimum amount of characters needed to update completions.
# Type: Int
c.completion.min_chars = 1

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 60000

# When to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
c.scrolling.bar = 'always'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Hide the statusbar unless a message is shown.
# Type: Bool
c.statusbar.hide = False

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'bottom': 0, 'left': 0, 'right': 0, 'top': 0}

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Format to use for the tab title. The following placeholders are
# defined:  * `{perc}`: Percentage as a string like `[10%]`. *
# `{perc_raw}`: Raw percentage, e.g. `10`. * `{title}`: Title of the
# current web page. * `{title_sep}`: The string ` - ` if a title is set,
# empty otherwise. * `{index}`: Index of this tab. * `{id}`: Internal
# tab ID of this tab. * `{scroll_pos}`: Page scroll position. *
# `{host}`: Host of the current web page. * `{backend}`: Either
# ''webkit'' or ''webengine'' * `{private}`: Indicates when private mode
# is enabled. * `{current_url}`: URL of the current web page. *
# `{protocol}`: Protocol (http/https/...) of the current web page. *
# `{audio}`: Indicator for audio/mute status.
# Type: FormatString
c.tabs.title.format = '{audio}{index}|{title}'

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = 100

# Maximum width (in pixels) of tabs (-1 for no maximum). This setting
# only applies when tabs are horizontal. This setting does not apply to
# pinned tabs, unless `tabs.pinned.shrink` is False. This setting may
# not apply properly if max_width is smaller than the minimum size of
# tab contents, or smaller than tabs.min_width.
# Type: Int
c.tabs.max_width = 250

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://google.com/'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}', 'ddg': 'https://duckduckgo.com/?q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://google.com'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#000088'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#000022'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = '#999999'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(55, 247, 133, 0.8), stop:1 rgba(55, 197, 66, 0.8))'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#000088'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#880000'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#222222'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = 'white'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#444444'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#222222'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#000088'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = 'white'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#000088'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = '#000022'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '8pt monospace'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '8pt sans-serif'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '8pt monospace'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '8pt monospace'

# Default font size (in pixels) for regular text.
# Type: Int
c.fonts.web.size.default = 13

# Default font size (in pixels) for fixed-pitch text.
# Type: Int
c.fonts.web.size.default_fixed = 10

# Bindings for normal mode
config.bind('<Ctrl+Shift+m>', 'hint links spawn --detach /home/jan-pieter/custum_scripts/addToMpv Music "{hint-url}"')
config.bind('<Ctrl+Shift+y>', 'hint links spawn --detach /home/jan-pieter/custum_scripts/addToMpv Video "{hint-url}"')
