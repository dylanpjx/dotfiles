alias ba='nvim ~/.bash_aliases'
alias ev='nvim ~/.config/nvim/init.vim'
alias eb='nvim ~/.bashrc'
alias sb='source ~/.bashrc'
alias yp='pwd | xclip -selection clipboard;echo "\"$PWD\" copied to clipboard"'
alias ws='nvim -S *.vim'
alias vim='nvim'
alias hlog='heroku logs -t --app ee2028-backend'
alias yt='youtube-dl -f bestaudio -x --audio-format mp3'
alias vifm='~/.config/vifm/scripts/vifmrun .'
alias todo='alacritty --title "joplin" -e joplin'
alias jn='conda activate base;jupyter notebook'
alias cm='cmake .. && make'
alias joplin='echo -ne "\033]0;joplin\007" && joplin'
alias ide='tmux splitw -h -p 40'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ptSh
alias ls="ptls"
# alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"
