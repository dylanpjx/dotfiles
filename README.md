# linux-configs

Using Linux Mint and Herbstluftwm. Clone this repo and run `$ ./stow.sh`. The
script uses `stow` to automatically symlink every dotfile in `dotfiles/home` to
its corresponding config location

## PPAs
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:polychromatic/stable
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:lazka/ppa
```

## Themeing

1. lxappearance
2. qt5ct

## Herbstluftwm

To update to the latest version:

1. Install the latest tarbell from [here](https://herbstluftwm.org/download.html)
2. Follow the installation instructions from [here](https://github.com/herbstluftwm/herbstluftwm/blob/master/INSTALL)
3. Once the installation is complete, replace `/usr/bin/herbstluftwm ` and `/usr/bin/herbstclient` with the one in build

## Disable Mouse Accel

- [Arch Wiki](https://wiki.archlinux.org/title/Mouse_acceleration#with_libinput)

## Xset

/etc/X11/xorg.conf.d/00-keyboard.conf

```
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "AutoRepeat" "200 30"
EndSection
```

## Suspend BIOS issue

- [Fix](https://www.reddit.com/r/gigabyte/comments/p5ewjn/b550i_pro_ax_f13_bios_sleep_issue_on_linux/?ref=share&ref_source=link)

## Date

- Set date and time on Windows and let it automatically check
- Go to Linux and type `timedatectl set-local-rtc 1`

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
5. [Disable HDMI](https://askubuntu.com/questions/228619/disable-sound-through-hdmi-permanently)
6. Required plugin could not be found -> `sudo apt install ubuntu-restricted-extras`

## Tablet

- [Digimend
  drivers](https://github.com/Huion-Linux/DIGImend-kernel-drivers-for-Huion)
- [Xsetwacom
  wiki](https://wiki.archlinux.org/index.php/Wacom_tablet#Mapping_pad_buttons_to_function_keys)
- `xsetwacom --list`
- `xev -event button`: Button 1,2,3,8

## Other utils

- [fd](https://github.com/sharkdp/fd#installation)
- [FZF](https://github.com/junegunn/fzf)
- [Dragon D&D](https://github.com/mwh/dragon)
- [Ueberzug](https://github.com/jstkdng/ueberzugpp)
- [Picom](https://github.com/yshui/picom)
- [xautocfg](https://github.com/SFTtech/xautocfg)

## Tray icons

- [Sound switcher](https://github.com/yktoo/indicator-sound-switcher)
- [volumeicon](https://manpages.ubuntu.com/manpages/focal/man1/volumeicon.1.html)
