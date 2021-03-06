# linux-configs

Using Pop!\_OS and AwesomeWM. Clone this repo and run `$ ./init.sh`. The script
uses `stow` to automatically symlink every dotfile in `dotfiles/linux` to its
corresponding config location

## Audio

1. Speakers are on `line-out`, headphones are on `headphone` in `pavucontrol`
2. If having no audio, use `alsamixer` to check sound card and check if
   `Auto-mute` is enabled
3. If having audio issues, edit the relevant config file in
   `/usr/share/pulseaudio/alsa-mixer/paths/` to enable/disable the correct
   sources/sinks. The sources/sinks currently enabled/disabled can be checked
   through `alsamixer`.
4. [Steps in
   site](https://unix.stackexchange.com/questions/602613/how-to-switch-between-headphones-and-speakers-without-disconnecting)

## Tablet

- [Digimend
  drivers](https://github.com/Huion-Linux/DIGImend-kernel-drivers-for-Huion)
- [Xsetwacom
  wiki](https://wiki.archlinux.org/index.php/Wacom_tablet#Mapping_pad_buttons_to_function_keys)
- `xsetwacom --list`
- `xev -event button`: Button 1,2,3,8

## AwesomeWM

- Default themes are in `/usr/share/awesome/themes/`
- [Docs](https://awesomewm.org/doc/api/index.html)
- [ArchWiki](https://wiki.archlinux.org/title/Awesome)

## Break on every kernel release

- Digimend drivers
- [Openrazer](https://openrazer.github.io/#download)
- [Droidcam](https://www.dev47apps.com/droidcam/linux/)
- [Ueberzug](https://github.com/seebye/ueberzug)

## Other utils

- [Dragon D&D](https://github.com/mwh/dragon)
- [Picom](https://github.com/yshui/picom)
- [FZF](https://github.com/junegunn/fzf)
- [PtSh](https://github.com/jszczerbinsky/ptSh)
- [Joplin](https://joplinapp.org/terminal/)
