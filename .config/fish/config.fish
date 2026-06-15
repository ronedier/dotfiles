if status --is-interactive
    set -U fish_greeting
    set -gx LANG "en_US.UTF-8"
    set -gx EDITOR "nvim"
    set -gx TERM "xterm-256color"
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
    set -gx GO111MODULE "on"
    set -gx fish_prompt_pwd_dir_length 0

    if test (uname) = Linux
        set -gx GIT_ASKPASS "/usr/bin/ksshaskpass"
        set -gx SSH_ASKPASS "/usr/bin/ksshaskpass"
    end


    fish_add_path -g $HOME/go/bin $HOME/.cargo/bin $HOME/.krew/bin

    switch (uname)
        case Linux
            fish_add_path -g $HOME/.nix-profile/bin $HOME/.opencode/bin $HOME/.atuin/bin /usr/local/cuda/bin $HOME/projects/external/llama.cpp/build/bin

        case Darwin
            fish_add_path -g $HOME/.local/bin /opt/local/bin /opt/local/sbin /usr/local/bin /Applications/Obsidian.app/Contents/MacOS
    end

    # Source work-specific config and functions which are ignored by git.
    source $HOME/.config/fish/work/*
    set -a fish_function_path $HOME/.config/fish/work/functions

    zoxide init fish --cmd cd | source
    atuin init fish --disable-ai --disable-up-arrow | source
end

# Theme apply
source $HOME/.config/fish/themes/avg_mirage.fish

abbr -a incognito 'fish --private'
abbr -a gtn 'git tag $(svu next)'
abbr -a grep 'rg'
