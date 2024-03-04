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

    starship init fish | source
    zoxide init --cmd cd fish | source
end
