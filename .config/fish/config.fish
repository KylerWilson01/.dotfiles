if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    alias vim="nvim"
    alias ls="ll"

    fish_add_path -g ~/.dotnet ~/.dotnet/tools
    fish_add_path -g ~/.local/bin
    fish_add_path -g /usr/local/go/bin
    fish_add_path -g ~/.cargo/bin

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
            echo $val | lolcat
            timer (pomo_options $val)m
            spd-say "'$val' session done"
        end
    end

    alias work="pomodoro 'work'"
    alias br="pomodoro 'break'"

    starship init fish | source
    zoxide init --cmd cd fish | source
end
