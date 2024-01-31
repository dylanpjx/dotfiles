function fish_mode_prompt --description 'Displays the current mode'
    # To reuse the mode indicator use this function instead
    # fish_default_mode_prompt
    switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
        case insert
            echo -en "\e[6 q"
        case replace_one
            echo -en "\e[4 q"
        case visual
            echo -en "\e[2 q"
        case '*'
            echo -en "\e[2 q"
    end
    set_color normal
end
