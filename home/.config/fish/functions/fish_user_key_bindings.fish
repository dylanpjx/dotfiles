function fish_user_key_bindings

    # So that we still have emacs keybindings in insert mode
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
