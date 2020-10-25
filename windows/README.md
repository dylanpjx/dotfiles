# windows-configs

Includes config files for `bash`, `nvim`, `tmux`, `vifm`, `Win terminal`, `bug.n`.

### `bug.n`(DWM clone for Windows) notes:
1. On first install, use `#^s` to generate a new cfg file.
2. Copy over the contents of [dwm example](https://raw.githubusercontent.com/wiki/fuhsjr00/bug.n/Configuration-examples/dwm_01.ini) to use as a base config file.
3. Change keybindings to your liking following [this](https://github.com/fuhsjr00/bug.n/blob/master/doc/Customization.md).

`Config_backColor_#1=101010;603000;Black;603000;Black;603000;000060;404040;080808` (Taken from [.](https://raw.githubusercontent.com/wiki/fuhsjr00/bug.n/Configuration-examples/joten_01.ini))

Noteable additions in bug.n cfg:
- `Config_hotkey=!o::Manager_override(1;0;0;0;1;0;)` is a manual override for any windows that do not seem to be behaving accordingly, eg. `Mail`
- Various config rules present for windows that don't respond to bug.n such as Steam, SumatraPdf and Musicbee
