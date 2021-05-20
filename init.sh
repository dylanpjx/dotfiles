#! bin/bash
add-apt-repository ppa:openrazer/stable
apt update
apt install nvim vifm qpdfview firefox quodlibet ffmpeg awesome 
\ python3 python3-pip default-jre npm nodejs
\ fzf ripgrep imwheel 
\ texlive-latex-extra texlive-science latexmk ttf-mscorefonts-installer pandoc
\ bcmwl-kernel-source openrazer-meta
\ scrot xclip libnotify
\ qt5ct lxappearance

pip3 install ueberzug

mv -t $HOME .imwheelrc .Xresources bash/* tmux/*
mv -t $HOME/.config awesome/ nvim/ alacritty/ vifm/ qpdfview
