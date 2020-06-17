# karabiner-windows-mode
Karabiner-Elements complex ruleset to make using Mac OS more sane by enabling common keyboard functionality used in Linux and Windows. Now powered by [Jsonnet](https://jsonnet.org), allowing the main file that needs to be interacted with (`windows_shortcuts.jsonnet`) to be much shorter and far more readable.

## Installation
Copy and paste the following URL into your browser window and Karabiner-Elements *should* ask to install the file:

    karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/rux616/karabiner-windows-mode/master/windows_shortcuts.json

## List of Shortcuts
First, a note about how these shortcuts are named in Karabiner-Elements. They follow the convention

    Key (Modifiers, if any) [Special notes, if any]

so they should be easy(ish) to understand. Contact me if you have improvement suggestions.

There are some applications, such as hypervisors, IDEs, remote desktops, and terminal emulators, that should receive raw inputs and handle them themselves. To that end, almost all shortcuts no longer apply to these applications. As such, the notes will no longer specify that the specific shortcut does not apply to the excepted applications as that is now the default state. Instead, they will note when a shortcut still applies.

Generally Excepted Applications:
* Hypervisors
  * Oracle VirtualBox VMs (not the VirtualBox manager application)
  * VMware Fusion
* IDEs
  * JetBrains IntelliJ IDEA CE
  * Sublime Text
  * Microsoft VSCode
* Remote Desktops
  * Microsoft Remote Desktop Connection
  * Citrix XenAppViewer
* Terminal Emulators
  * Alacritty
  * Hyper
  * iTerm2
  * Terminal

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

### Command Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| Backspace | Ctrl | Backspace | Option |  |
| Delete | Ctrl | Delete | Option |  |
| Enter | Ctrl | Enter | Command |  |
| Enter | Ctrl+Shift | Enter | Command+Shift |  |

[//]: # (### Modifier Keys)
[//]: # (| Win |  | Launchpad |  | Works in Terminal/iTerm2. |)

### Alphanumeric Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| A | Ctrl | A | Command |  |
| B | Ctrl | B | Command |  |
| C | Ctrl | C | Command |  |
| C | Ctrl+Shift | C | Command | Only applies to Terminal Emulators. |
| F | Ctrl | F | Command |  |
| I | Ctrl | I | Command |  |
| L | Win | (Shell Command) |  | Use only 1 Win+L shortcut. Invokes Login Window. Turn on [Fast User Switching](https://support.apple.com/kb/PH25396) first. Executes `/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend`. Works in Excepted Applications. |
| L | Win | Power | Control+Shift | Use only 1 Win+L shortcut. Invokes Lock Screen. Note that the screen doesn't always fully lock right away. Works in Excepted Applications. |
| L | Alt+Ctrl | (Shell Command) |  | Use only 1 Alt+Ctrl+L shortcut. Invokes Login Window. Turn on [Fast User Switching](https://support.apple.com/kb/PH25396) first. Executes `/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend`. Works in Excepted Applications. |
| L | Alt+Ctrl | Power | Control+Shift | Use only 1 Alt+Ctrl+L shortcut. Invokes Lock Screen. Note that the screen doesn't always fully lock right away. Works in Excepted Applications. |
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

### Punctuation Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| / | Ctrl | / | Command | Works in Terminal Emulators. |
| Space | Ctrl | Space | Command |  |

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

## Links
- Karabiner-Elements [(Homepage)](https://pqrs.org/osx/karabiner/) [(GitHub)](https://github.com/tekezo/Karabiner-Elements)

## Contributing
PRs and issues are welcome. Please refrain from making changes directly to `windows_shortcuts.json` and instead make your additions in the `*.libsonnet` and `*.jsonnet` files.

For testing, get [Jsonnet](https://jsonnet.org) (I use the [C++ version](https://github.com/google/jsonnet) personally, but a [Go version](https://github.com/google/go-jsonnet) is also available), render the json file locally (`jsonnet -o test.json windows_shortcuts.jsonnet`) and test it in Karabiner Elements to ensure your changes work how you think they should work.

Once your testing is done, use the following command to ensure your changes are syntactically valid jsonnet and that they are formatted:

```shell
jsonnet windows_shortcuts.jsonnet >/dev/null && \
  jsonnetfmt -i *.jsonnet *.libsonnet && \
  echo "Checked and formatted!"
```

If you see "Checked and formatted!" then you should be ready to commit your changes and submit a PR.

**MAKE SURE TO NOTE YOUR CHANGES IN THE RELEVANT PLACES IN THE README**
