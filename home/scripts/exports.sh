#!/bin/sh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export STACK_XDG=1

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc 
export NVM_DIR="$XDG_DATA_HOME/nvm"

export WGETRC="$XDG_CONFIG_HOME/wgetrc"
