# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load aliases and shortcuts if existent.
# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh

# Check if in ~/.dotfiles or ~/.config/nvim directory
if [[ "$(pwd)" = "${HOME}/.dotfiles"* || "$(pwd)" = "${HOME}/.config/nvim"* ]]; then
    # Check if SSH_AUTH_SOCK is not set or empty
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_getout
    fi
fi

export PATH="$PATH:$(find ~/.dotfiles/myscripts -type d | paste -sd ':' -)"
# exported paths environmental ENVIROMENTAL
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/home/debian/Downloads/piper"
export PATH="$HOME/.myscripts:$PATH"
export PATH="$PATH:/home/kali/.local/share/applications"
export FPATH="$HOME/eza/completions/zsh:$FPATH"
export PATH="/usr/local/nvim/nvim-linux64/bin:$PATH"
export PATH="$PATH:~/flutter/bin"
export PATH="/snap/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar:$PATH"
export CM_LAUNCHER=rofi

bindkey -e

#replace apt with nala
apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes (simple)
ZSH_THEME="alanpeabody"

# Check if we are in tmux
if [ ! -z "$TMUX" ]; then
    # Deactivate Powerlevel10k theme within tmux
    ZSH_THEME="simple"
fi

# Check if we are in st terminal
# if xprop -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}') WM_CLASS | grep -q '"st"'; then
#     # Deactivate Powerlevel10k theme within st terminal
#     ZSH_THEME="alanpeabody"
# fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
#zsh-autocomplete

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias lfd='ranger'
alias sxiv='nsxiv'
alias ns='nsxiv'
alias forloop='for f in *.jpg ; do echo $f ; done'
alias cm='clipmenu'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias c='clear'

# force zsh to show the complete history
alias history="history 0"

# nvims aliases 
alias v='nvim'
alias vim='nvim'
alias n='nvim'
alias p="NVIM_APPNAME=paulo nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-prime="NVIM_APPNAME=prime nvim"
alias nvim-chad="NVIM_APPNAME=nvchad nvim"
alias chad="NVIM_APPNAME=nvchad nvim"
alias nvim-astro="NVIM_APPNAME=astro nvim"
# alias nvim-kick="NVIM_APPNAME=kickstart nvim"

# some more ls aliases
alias path="echo $PATH | tr ':' '\n'"
alias list='eza --long --header -g --icons'
alias leza='eza --long --header -g --icons'
alias ll='eza --long --header -g --icons -a'
alias lezat='eza --long --header -g --icons --tree --level=2 -a'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -la'
alias tspreed='tspreed -k'
alias lol='ls -A | lolcat'
alias matrixlol='cmatrix | lolcat'
alias aqua='asciiquarium'
alias aqualol='asciiquarium | lolcat'
alias llal='ls -la | lolcat'
alias lsal='ls -a'
alias lsa='ls -a'
alias lf='lfub'
alias allapps="apt-mark showmanual | xargs apt-cache show | awk '/Package:/ {printf \$2 \"----->(Version:\"} /Version:/ {print \$2\")\"}' | grep --color=always -E 'Version:|$'"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# my other
# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi


if [ -e /home/kali/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kali/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

if [ -e /home/debian/.nix-profile/etc/profile.d/nix.sh ]; then . /home/debian/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
