# linux-configs

Using Pop!\_OS and AwesomeWM. Clone this repo and run `sudo ./init.sh`

## Droidcam

1. Go to [releases](https://github.com/aramg/droidcam/releases)
2. Install the latest release
3. Unzip and then run `./install`
4. `sudo apt install adb`
5. In terminal, type `Droidcam` and it will run

## Audio

1. Speakers are on `line-out`, headphones are on `headphone`
2. Play some audio
3. Go to `alsamixer` and configure accordingly
4. Save using `sudo alsactl store`

## Tablet

- [https://github.com/Huion-Linux/DIGImend-kernel-drivers-for-Huion](Digimend drivers)
- [https://wiki.archlinux.org/index.php/Wacom_tablet#Mapping_pad_buttons_to_function_keys](Xsetwacom wiki)
- `xsetwacom --list`
- `xev -event button`: Button 1,2,3,8

## Other utils:
[Dragon D&D](https://github.com/mwh/dragon)
[Picom](https://github.com/yshui/picom)
[FZF](https://github.com/junegunn/fzf)
[PtSh](https://github.com/jszczerbinsky/ptSh)
