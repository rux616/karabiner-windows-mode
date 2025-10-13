{
  //--------------------//
  // BUNDLE IDENTIFIERS //
  //--------------------//

  // bundle identifiers for hypervisor applications
  hypervisors: [
    // Oracle VirtualBox
    '^org\\.virtualbox\\.app\\.VirtualBoxVM$',
    // Parallels
    '^com\\.parallels\\.desktop\\.console$',
    // VMWare Fusion
    '^org\\.vmware\\.fusion$',
  ],

  // bundle identifiers for IDE applications
  ides: [
    // GNU Emacs (GUI)
    '^org\\.gnu\\.emacs$',
    '^org\\.gnu\\.Emacs$',
    // JetBrains tools
    '^com\\.jetbrains',
    // Microsoft VSCode
    '^com\\.microsoft\\.VSCode$',
    // VSCodium - Open Source VSCode
    '^com\\.vscodium$',
    // Sublime Text
    '^com\\.sublimetext\\.3$',
    // Kitty
    '^net\\.kovidgoyal\\.kitty$',
    // Beyond Compare 4 & 5
    '^com\\.ScooterSoftware',
    // Zed
    '^dev\\.zed\\.Zed$',
  ],

  // bundle identifiers for remote desktop applications
  remoteDesktops: [
    // Citrix XenAppViewer
    '^com\\.citrix\\.XenAppViewer$',
    // Microsoft Remote Desktop Connection
    '^com\\.microsoft\\.rdc\\.macos$',
  ],

  // bundle identifiers for terminal emulator applications
  terminalEmulators: [
    // Alacritty (New)
    '^com\\.alacritty$',
    // Alacritty (Old)
    '^io\\.alacritty$',
    // Hyper
    '^co\\.zeit\\.hyper$',
    // iTerm2
    '^com\\.googlecode\\.iterm2$',
    // Terminal
    '^com\\.apple\\.Terminal$',
    // WezTerm
    '^com\\.github\\.wez\\.wezterm$',
    // Ghostty
    '^com\\.mitchellh\\.ghostty$',
  ],

  // bundle identifiers for web browser applications
  webBrowsers: [
    // Google Chrome
    '^com\\.google\\.chrome$',
    '^com\\.google\\.Chrome$',
    // Mozilla Firefox
    '^org\\.mozilla\\.firefox$',
    '^org\\.mozilla\\.nightly$',
    // Brave Browser
    '^com\\.brave\\.Browser$',
    // Safari
    '^com\\.apple\\.Safari$',
  ],
}
