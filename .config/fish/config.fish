if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path /home/kylerw/.local/bin

    alias vim="nvim"
    alias cd="z"
    alias ls="ll"

    set -Ux EXA_STANDARD_OPTIONS --group --header --group-directories-first --all --icons

    starship init fish | source
    zoxide init fish | source
end
