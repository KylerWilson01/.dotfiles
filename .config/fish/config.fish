if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    alias vim="nvim"
    alias ls="ll"

    function fjq
        command jq -c $argv[1] | fzf --preview "printf %s {} | jq" -e | jq
    end

    fish_add_path -g ~/.dotnet ~/.dotnet/tools
    fish_add_path -g ~/.local/bin
    fish_add_path -g /usr/local/go/bin
    fish_add_path -g ~/go/bin
    fish_add_path -g ~/.cargo/bin
    fish_add_path -g /opt/mssql-tools18/bin/

    set -Ux GTK_IM_MODULE fcitx
    set -Ux QT_IM_MODULE fcitx
    set -Ux XMODIFIERS @im=fcitx
    set -Ux LD_LIBRARY_PATH /usr/lib/libmpc.so

    set -gx EDITOR nvim

    set --universal nvm_default_version 18

    set -Ux EXA_STANDARD_OPTIONS --group --header --group-directories-first --all --icons

    function pomo_options
        switch $argv[1]
        case 'work'
            echo '45'
        case 'break'
            echo '10'
        end
    end

    function pomodoro
        set -l val $argv[1]

        if test -n "$val" -a (pomo_options $val)
            clear
            echo $val | lolcat
            timer (pomo_options $val)m
            spd-say "'$val' session done"
        end
    end

    alias work="pomodoro 'work'"
    alias br="pomodoro 'break'"

    starship init fish | source
    zoxide init --cmd cd fish | source

    set fzf_preview_dir_cmd eza --all --color=always
end

fish_add_path /home/kyler/.spicetify
