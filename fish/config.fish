set -g fish_greeting

set --global pure_show_system_time true
set --global pure_color_system_time pure_color_mute

set PATH "$PATH":"$HOME/.local/scripts/"

starship init fish | source
zoxide init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    function lss
        eza -l --group-directories-first --icons=always --color=always --no-user --no-time --no-filesize --git
    end

    function lsa
        eza -l -a --group-directories-first --icons=always --color=always --git
    end

    function lst
        eza -l -a -T --group-directories-first --icons=always --color=always --git --level=3
    end

    function c
        clear
        neofetch
    end

    function lg
        lazygit
    end

    function n
        nvim
    end

    function lg
        lazygit
    end

    function fish
        source ~/.config/fish/config.fish
    end

    function ze
        zellij attach -c home
    end

    # Git

    function gs
        git status
    end

    function gd
        git diff --output-indicator-new=' ' --output-indicator-old=' '
    end

    function gds
        git diff --staged
    end

    function ga
        git add
    end

    function gap
        git add --patch
    end

    function gc
        git commit
    end

    function gca
        git commit --amend --no-edit
    end

    function gb
        git branch
    end
end

# Created by `pipx` on 2025-08-04 22:01:49
set PATH $PATH /Users/joavor/.local/bin
