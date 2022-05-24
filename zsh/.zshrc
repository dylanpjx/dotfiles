# Exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/dylan/.oh-my-zsh"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Settings
## History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

## Init colours and prompt
autoload -Uz colors && colors	
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '[%b]'

setopt prompt_subst
PROMPT='%B%F{108}%~%f%b '
PROMPT+="%(?:%{$fg_bold[green]%}→ :%{$fg_bold[red]%}→ )"
PROMPT+="%{$reset_color%}"

RPROMPT=\$vcs_info_msg_0_

## Autocomplete and correction
autoload -Uz compinit promptinit
compinit
promptinit
_comp_options+=(globdots)	
setopt autocd extendedglob nomatch menucomplete correct_all
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

## Disable Ctrl-s
stty stop undef

# Binds
bindkey '^ ' autosuggest-accept

# Themes and plugins
## Vi-mode
function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_VI_SURROUND_BINDKEY=classic
}
source $ZPLUGINS/zsh-vi-mode/zsh-vi-mode.plugin.zsh

## Auto suggest
source $ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
# Aliases
alias vim=nvim
alias v=nvim
alias ws='nvim -S *.vim'

alias ev='nvim $HOME/.config/nvim/init.vim'
alias eb='nvim $HOME/.bashrc'
alias ba='nvim $HOME/.bash_aliases'
alias sb='source $HOME/.bashrc'
alias ez='nvim $HOME/.config/zsh/.zshrc'
alias sz='source $HOME/.config/zsh/.zshrc'
alias yp='pwd | xclip -selection clipboard;echo "\"$PWD\" copied to clipboard"'
alias yt='youtube-dl -f bestaudio -x --audio-format mp3'
alias vifm='$HOME/.config/vifm/scripts/vifmrun .'
alias todo='alacritty --title "joplin" -e joplin'

alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ide='tmux splitw -h -p 40'

# FZF
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojump
[[ -s /home/dylan/.autojump/etc/profile.d/autojump.sh ]] && source /home/dylan/.autojump/etc/profile.d/autojump.sh
