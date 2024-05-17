# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

[ -f "$MBSYNCRC" ] && alias mbsync="mbsync -c $MBSYNCRC"

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

se() {
	choice="$(find ~/.local/bin -mindepth 1 -printf '%P\n' | fzf)"
	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
	;}


# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	rsync="rsync -vrPlu" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ytt="yt --skip-download --write-thumbnail" \
	ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="pacman" \
	xi="sudo xbps-install" \
	xr="sudo xbps-remove -R" \
	xq="xbps-query" \
	za="zathura"


alias \
	lf="lfub" \
	magit="nvim -c MagitOnly" \
	ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" \
	weath="less -S ${XDG_CACHE_HOME:-$HOME/.cache}/weatherreport" \

# my alias some more ls aliases
alias path="echo $PATH | tr ':' '\n'"
alias list='eza --long --header -g --icons'
alias leza='eza --long --header -g --icons'
alias le='eza --long --header -g --icons'
alias lea='eza --long --header -g --icons -a'
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
alias cm='clipmenu'
alias n='nvim'
alias x='xrdb ~/.config/x11/xresources'
alias fw='find ~/Pictures -type f -name "*.jpg" -o -name "*.png" | shuf  | nsxiv -'
alias fp='find ~/Pictures -type f -name "*.jpg" -o -name "*.png" | shuf  | nsxiv -'

bindkey -s '^o' '^ulfcd\n'

# bindkey -s '^a' '^ubc -lq\n'

