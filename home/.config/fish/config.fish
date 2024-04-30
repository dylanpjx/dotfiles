if status is-interactive
    # Commands to run in interactive sessions can go here
    if string match -q -- 'tmux*' $TERM
        set -g fish_vi_force_cursor 1
    end
end

# suppress fish greeting
set fish_greeting

# env vars
set -gx EDITOR nvim

# abbr -a
abbr -a c 'clear'

abbr -a xs 'xset r rate 250 30'
abbr -a yp 'pwd | xclip -selection clipboard;echo "\"$PWD\" copied to clipboard"'

abbr -a f 'vifmrun .'
abbr -a p 'zathura'
abbr -a hc 'herbstclient'
abbr -a ws 'nvim -S *.vim'
abbr -a vim 'nvim'
abbr -a v 'nvim'
abbr -a note 'cd $HOME/Documents/Notes/;nvim .'

abbr -a weather 'curl wttr.in/Singapore'
abbr -a yt 'youtube-dl -f bestaudio -x --audio-format mp3'

abbr -a jn 'conda activate base;jupyter notebook'
abbr -a venv 'source ~/venv/bin/activate.fish'

abbr -a ll 'ls -alF'
abbr -a la 'ls -A'
abbr -a l 'ls -CF'
abbr -a fe 'funced -e nvim'
abbr -a x 'extract .'

zoxide init fish | source
