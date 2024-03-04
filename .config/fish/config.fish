if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path /home/kylerw/.local/bin

    alias vim="nvim"

    starship init fish | source
    zoxide init fish | source
end
