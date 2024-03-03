# karabiner-windows-mode
Karabiner-Elements complex ruleset to make using macOS friendlier by enabling common keyboard functionality used in Linux and Windows. Powered by [Jsonnet](https://jsonnet.org), allowing the main files that need to be interacted with (`*.jsonnet` and `*.libsonnet`) to be much shorter and far more readable.

If you'd like to contribute to this project, please check the [Contributing](#contributing) section.

## Table of Contents
- [karabiner-windows-mode](#karabiner-windows-mode)
    - [Table of Contents](#table-of-contents)
    - [Installation](#installation)
    - [List of Shortcuts](#list-of-shortcuts)
        - [Navigation Keys](#navigation-keys)
        - [Command Keys](#command-keys)
        - [Modifier Keys](#modifier-keys)
        - [Alphanumeric Keys](#alphanumeric-keys)
        - [Punctuation Keys](#punctuation-keys)
        - [Function Keys](#function-keys)
    - [Credits](#credits)
    - [Links](#links)
    - [Contributing](#contributing)
        - [Adding Exceptions](#adding-exceptions)
        - [Testing](#testing)


## Installation
Copy and paste the following URL into your browser window and Karabiner-Elements *should* ask to install the file:

```none
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/rux616/karabiner-windows-mode/master/json/windows_shortcuts.json
```

([TOC](#table-of-contents))


## List of Shortcuts
First, a note about how these shortcuts are named in Karabiner-Elements. They follow the convention

```none
Key (Modifiers, if any) [Special notes, if any]
```

so they should be easy(ish) to understand. Contact me if you have improvement suggestions.

There are some applications, such as hypervisors, IDEs, remote desktops, and terminal emulators, that should receive raw inputs and handle them themselves. To that end, almost all shortcuts no longer apply to these applications. As such, the notes will no longer specify that the specific shortcut does not apply to the excepted applications as that is now the default state. Instead, they will note when a shortcut still applies.

Generally Excepted Applications:
- Hypervisors
    - Oracle VirtualBox VMs (not the VirtualBox manager application)
    - Parallels
    - VMware Fusion
- IDEs
    - GNU Emacs (GUI)
    - JetBrains (All)
    - Microsoft VSCode
    - Sublime Text
- Remote Desktops
    - Chrome Remote Desktop (app version, not in-browser version)
    - Citrix XenAppViewer
    - Microsoft Remote Desktop Connection
- Terminal Emulators
    - Alacritty
    - Hyper
    - iTerm2
    - Kitty
    - Terminal
    - WezTerm

List of Web Browsers:
- Apple Safari
- Brave Browser
- Google Chrome
- Mozilla Firefox
- Mozilla Firefox Nightly

([TOC](#table-of-contents))

### Navigation Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| Insert | Ctrl | C | Command | Use only 1 Ctrl+Insert shortcut. Works in Terminal Emulators. |
| Insert | Ctrl | C | Command | Use only 1 Ctrl+Insert shortcut. |
| Insert | Shift | V | Command | Use only 1 Shift+Insert shortcut. Works in Terminal Emulators. |
| Insert | Shift | V | Command | Use only 1 Shift+Insert shortcut. |
| Home |  | Left Arrow | Command |  |
| Home | Ctrl | Up Arrow | Command |  |
| Home | Shift | Left Arrow | Command+Shift |  |
| Home | Ctrl+Shift | Up Arrow | Command+Shift |  |
| End |  | Right Arrow | Command |  |
| End | Ctrl | Down Arrow | Command |  |
| End | Shift | Right Arrow | Command+Shift |  |
| End | Ctrl+Shift | Down Arrow | Command+Shift |  |
| Left Arrow | Ctrl | Left Arrow | Option |  |
| Left Arrow | Ctrl+Shift | Left Arrow | Option+Shift |  |
| Right Arrow | Ctrl | Right Arrow | Option |  |
| Right Arrow | Ctrl+Shift | Right Arrow | Option+Shift |  |

([TOC](#table-of-contents))

### Command Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| Backspace | Ctrl | Backspace | Option |  |
| Delete | Ctrl | Delete | Option |  |
| Enter | Ctrl | Enter | Command |  |
| Enter | Ctrl+Shift | Enter | Command+Shift |  |

([TOC](#table-of-contents))

### Modifier Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| Win |  | Spotlight |  | Works in Excepted Applications. |

([TOC](#table-of-contents))

### Alphanumeric Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| A | Ctrl | A | Command |  |
| B | Ctrl | B | Command |  |
| C | Left Ctrl | C | Command |  |
| C | Ctrl+Shift | C | Command | Only applies to Terminal Emulators. |
| F | Ctrl | F | Command |  |
| I | Ctrl | I | Command |  |
| L | Alt+Ctrl | Q | Control+Command | Use only 1 Alt+Ctrl+L shortcut. Invokes Lock Screen. Works in Excepted Applications. |
| L | Alt+Ctrl | Power | Control+Shift | Use only 1 Alt+Ctrl+L shortcut. Invokes Lock Screen. Note that the screen doesn't always fully lock right away. Works in Excepted Applications. |
| L | Ctrl | L | Command | Only Applies to Web Browsers. |
| L | Win | Q | Control+Command | Use only 1 Win+L shortcut. Invokes Lock Screen. Works in Excepted Applications. |
| L | Win | Power | Control+Shift | Use only 1 Win+L shortcut. Invokes Sleep. Note that the screen doesn't always fully lock right away. Works in Excepted Applications. |
| N | Ctrl | N | Command |  |
| O | Ctrl | O | Command |  |
| P | Ctrl | P | Command |  |
| R | Ctrl | R | Command |  |
| S | Ctrl | S | Command |  |
| T | Ctrl | T | Command |  |
| U | Ctrl | U | Command |  |
| V | Ctrl | V | Command |  |
| V | Ctrl+Shift | V | Command | Only applies to Terminal Emulators. |
| W | Ctrl | W | Command |  |
| X | Ctrl | X | Command |  |
| Y | Ctrl | Y | Command |  |
| Z | Ctrl | Z | Command |  |
| 1 | Command | (Shell Command) | | Launches or switches to the app pinned to the first position in the dock (always Finder). Works in IDEs and Terminal Emulators. |
| 2 | Command | (Shell Command) | | Launches or switches to the app pinned to the second position in the dock. Works in Terminal IDEs and Emulators. |
| 3 | Command | (Shell Command) | | Launches or switches to the app pinned to the third position in the dock. Works in Terminal IDEs and Emulators. |
| 4 | Command | (Shell Command) | | Launches or switches to the app pinned to the fourth position in the dock. Works in Terminal IDEs and Emulators. |
| 5 | Command | (Shell Command) | | Launches or switches to the app pinned to the fifth position in the dock. Works in Terminal IDEs and Emulators. |
| 6 | Command | (Shell Command) | | Launches or switches to the app pinned to the sixth position in the dock. Works in Terminal IDEs and Emulators. |
| 7 | Command | (Shell Command) | | Launches or switches to the app pinned to the seventh position in the dock. Works in Terminal IDEs and Emulators. |
| 8 | Command | (Shell Command) | | Launches or switches to the app pinned to the eighth position in the dock. Works in Terminal IDEs and Emulators. |
| 9 | Command | (Shell Command) | | Launches or switches to the app pinned to the ninth position in the dock. Works in Terminal IDEs and Emulators. |

([TOC](#table-of-contents))

### Punctuation Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| / | Ctrl | / | Command | Works in Terminal Emulators. |
| Space | Ctrl | Space | Command |  |
| Tab | Alt | Tab | Command | Works in IDEs and Terminal Emulators. |

([TOC](#table-of-contents))

### Function Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| F1 |  | / | Command+Shift |  |
| F3 |  | G | Command |  |
| F4 | Alt | Q | Command | Works in Terminal Emulators. |
| F4 | Ctrl | W | Command | Only applies to Google Chrome. |


## Credits
- [@TechnicallyDifficult](https://github.com/TechnicallyDifficult) for coming up with the initial json file
- [@alvaro1728](https://github.com/alvaro1728) for creating the current json file and for [asking the question](https://github.com/tekezo/Karabiner-Elements/issues/249) that got this whole thing started
- [@tezeko](https://github.com/tekezo) for Karabiner-Elements
- [@lsissoko](https://github.com/lsissoko) for Ctrl+R and Ctrl+W additions
- [@aperlstein](https://github.com/aperlstein) for adding Ctrl+Enter, Ctrl+Shift+Enter, Ctrl+Space, and for adding Citrix XenAppViewer to list of exceptions
- [@Ivanca](https://github.com/Ivanca) for adding IDEs to list of exceptions
- [@from-nibly](https://github.com/from-nibly) for adding VMware Fusion to list of exceptions
- [@andormarkus](https://github.com/andormarkus) for adding JetBrains PyCharm to list of exceptions
- [@amateescu](https://github.com/amateescu) for adding JetBrains PhpStorm to list of exceptions
- [@vidurb](https://github.com/vidurb) for adding GNU Emacs to list of exceptions, and the Cmd+<Number> shortcuts
- [@jkluch](https://github.com/jkluch) for adding Microsoft RDC to list of exceptions
- [@csmager](https://github.com/csmager) for adding Parallels and JetBrains Rider to list of exceptions
- [@kingamajick](https://github.com/kingamajick) for adding WezTerm and Chrome Remote Desktop (enabling support for file_paths to identify applications) to the list of exceptions
- [@raxigan](https://github.com/raxigan) for simplifying JetBrains IDE listing and adding the Win [Spotlight] shortcut
- [@necojackarc](https://github.com/necojackarc) for fixing Win+L in newer versions of macOS
- [@edance](https://github.com/edance) for adding an additional Emacs bundle, adding "L (Ctrl) [Web Browsers Only]", and expanding the list of web browsers
- [@fab1o](https://github.com/fab1o) for the JSON for Alt+Tab (#14)

([TOC](#table-of-contents))


## Links
- Karabiner-Elements [(Homepage)](https://karabiner-elements.pqrs.org/) [(GitHub)](https://github.com/tekezo/Karabiner-Elements)

([TOC](#table-of-contents))


## Contributing

Pull requests (PRs) and issues are welcome! But first, some notes:

- Make sure to note your changes in the relevant places in the readme
- Remember to give yourself credit in [Credits](#credits) section
- Don't change any `*.json` files! They are automatically rendered and your changes will be overridden.

Again, please refrain from making changes directly to any `*.json` files (all JSON files will be rendered automatically as necessary on a push to the master branch) and instead make your additions in the `*.jsonnet` and `*.libsonnet` files and submit a PR. A comment will automatically be added to the PR showing any JSON changes that will result.

([TOC](#table-of-contents))

### Adding Exceptions
When adding exceptions, you will need the applications "bundle identifier". To get this, you can use the following AppleScript ([SuperUser thread](https://superuser.com/q/346369)):

```applescript
osascript -e 'id of app "<application>"'
```

In the above example, `<application>` is the name of the application, such as `Finder` or `Microsoft Excel`.

Once you have the bundle identifier, which will be, for example, `com.microsoft.VSCode` for Microsoft VSCode, you will need to add it to the `bundle.libsonnet` file in the appropriate section. Since VSCode is an IDE, we would add it to the `ides: [ ... ],` section. Make sure to add `^` at the beginning, and `$` at the end of the identifier, and to add `\\` before any periods. (Look in the file and follow the pattern.)

([TOC](#table-of-contents))

### Testing
For testing, get [Jsonnet](https://jsonnet.org) (I use the [C++ version](https://github.com/google/jsonnet) personally, but a [Go version](https://github.com/google/go-jsonnet) is also available), render the json file locally (`jsonnet -- ./jsonnet/windows_shortcuts.jsonnet >./json/windows_shortcuts.json`) and test it in Karabiner Elements to ensure your changes work how you think they should work.

Once your testing is done, you can simply run `make` to ensure your changes are syntactically valid jsonnet and that they are formatted. If you don't get any errors, then you should be ready to commit your changes and submit a PR.

([TOC](#table-of-contents))
