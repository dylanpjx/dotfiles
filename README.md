# linux-configs

Using Pop!\_OS and AwesomeWM.

## Wifi setup

```
sudo apt install bcmwl-kernel-source
sudo reboot
```

## Keyboard

```
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250

xset r rate 250 30
```

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

## Mouse

1. `sudo apt install openrazer`

## Scroll wheel

1. `sudo apt install imwheel`
2. Add `imwheel -b "4 5"` to startup
3. `mv .imwheelrc ~/`

## Vimtex

```
sudo apt install texlive-latex-extra latexmk ttf-mscorefonts-installer
```

## Vifm image preview

```
sudo pip3 install ueberzug
```

`sudo apt install nvim vifm qpdfview firefox quodlibet ffmpeg awesome`
