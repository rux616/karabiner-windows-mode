# karabiner-windows-mode
Karabiner-Elements complex ruleset to make using Mac OS more sane by enabling common keyboard functionality used in Linux and Windows.

## Installation
Copy and paste the following URL into your browser window and Karabiner-Elements *should* ask to install the file:

    karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/rux616/karabiner-windows-mode/master/windows_shortcuts.json

## List of Shortcuts
First, a note about how these shortcuts are named in Karabiner-Elements. They follow the convention

    Key (Modifiers, if any) [Special notes, if any]

so they should be easy(ish) to understand. Contact me if you have improvement suggestions.

There are some applications, such as terminal emulators and virtual machines, that should receive raw inputs and handle them themselves. To that end, almost all shortcuts no longer apply to these applications. As such, the notes will no longer specify that the specific shortcut does not apply to the excepted applications as that is now the default state. Instead, they will note when a shortcut still applies.

Excepted Applications:
* Terminal Emulators
  * Terminal
  * iTerm2
* Virtual Machines
  * VirtualBox VMs (not the VirtualBox manager application)

### Navigation Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
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

### Function Keys
| Input Key | Input Modifier(s) | Output Key | Output Modifier(s) | Notes |
|-|-|-|-|-|
| F1 |  | / | Command+Shift |  |
| F3 |  | G | Command |  |
| F4 | Alt | Q | Command | Works in Terminal Emulators. |

## Credits
- [@TechnicallyDifficult](https://github.com/TechnicallyDifficult) for coming up with the initial json file
- [@alvaro1728](https://github.com/alvaro1728) for creating the current json file and for [asking the question](https://github.com/tekezo/Karabiner-Elements/issues/249) that got this whole thing started
- [@tezeko](https://github.com/tekezo) for Karabiner-Elements
- [@lsissoko](https://github.com/lsissoko) for Ctrl+R and Ctrl+W additions

## Links
- Karabiner-Elements [(Homepage)](https://pqrs.org/osx/karabiner/) [(GitHub)](https://github.com/tekezo/Karabiner-Elements)
