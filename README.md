# linux-configs

## Currently on AwesomeWM + PopOS

## Todo:

1. xinput (Mouse)

## Wifi setup

```
sudo apt install bcmwl-kernel-source
sudo reboot
```

## Keyboard (Gnome)

```
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
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

## Scroll wheel

1. `sudo apt install imwheel`
2. Download [script](http://www.nicknorton.net)
3. `chmod +x mousewheel.sh`
4. `./mousewheel.sh`
5. Add `imwheel -b "4 5"` to startup

## Vimtex

```
sudo apt install texlive-latex-extra
sudo apt install latexmk
sudo apt install ttf-mscorefonts-installer
```

nvim, vifm, qpdfview, alacritty, firefox, quod libet
