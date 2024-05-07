set fish_greeting "Welcome to fish shell 🐟"
function clear
    command clear
    echo "fish shell 🐟"
end

set -gx TERM xterm-256color

function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cf peco_change_directory
end

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g theme_display_font "CodeNewRoman Nerd Font"

# aliases
alias tree "eza --tree --level=2 -a"
alias lsa "ls -a -CF"
alias vim "nvim"
alias n "nvim"
alias v "nvim"
alias leza "eza --long --header -g --icons"
alias lezat "eza --long --header -g --icons --tree --level=2 -a"
alias la "ls -A"
alias ll "eza --long --header"
alias lla "ll -A"
alias c "clear"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
