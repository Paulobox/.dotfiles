#### *<div align="right"><sub>◾Paulius .dotfiles</sub></div>* <br>

<a href="#mouse-scroll"><kbd> <br> mouse scroll <br> </kbd></a>&ensp;&ensp;
<a href="#no bios beeping"><kbd> <br> no beeping <br> </kbd></a>&ensp;&ensp;
<a href="#asciiquarium"><kbd> <br> asciiquarium <br> </kbd></a>&ensp;&ensp;
<a href="#awesome-wm"><kbd> <br> Awesome-WM <br> </kbd></a>&ensp;&ensp;
<a href="#eza"><kbd> <br> Eza <br> </kbd></a>&ensp;&ensp;
<a href="#fzf"><kbd> <br> fzf <br> </kbd></a>&ensp;&ensp;
<a href="#nala"><kbd> <br> Nala(debian) <br> </kbd></a>&ensp;&ensp;
<a href="#neovim"><kbd> <br> Neovim <br> </kbd></a>&ensp;&ensp;
<a href="#nerd-fonts"><kbd> <br> Nerd Fonts <br> </kbd></a>&ensp;&ensp;
<a href="#rofi-program-launcher"><kbd> <br> Rofi <br> </kbd></a>&ensp;&ensp;
<a href="#GoLang"><kbd> <br> GoLang <br> </kbd></a>&ensp;&ensp;
<a href="#tgpt--piper"><kbd> <br> tgpt + piper <br> </kbd></a>&ensp;&ensp;
<a href="#oh-my-zsh-zsh-syntax-highlighting-sh-autosuggestions-powerlevel10k"><kbd> <br> oh-my-zsh <br> </kbd></a>&ensp;&ensp;
<a href="#tmux--tpm"><kbd> <br> tmux + tpm <br> </kbd></a>&ensp;&ensp;
<a href="#lf-terminal-based-file-manager"><kbd> <br> lf (file manager) <br> </kbd></a>&ensp;&ensp;
<a href="#thunar"><kbd> <br> Thunar (custom actions) <br> </kbd></a>&ensp;&ensp;
<a href="#pywall"><kbd> <br> pywall <br> </kbd></a>&ensp;&ensp;
<a href="#dwm"><kbd> <br> dwm <br> </kbd></a>&ensp;&ensp;

# Essential
```
sudo apt install git stow wget unzip zsh -y
```
<details><summary>arch</summary>
sudo pacman -S git stow wget unzip zsh --noconfirm
</details>

# .dotfiles install
1.
```
git clone https://github.com/Paulobox/.dotfiles
```
2.
```
cd .dotfiles
```
4.
```
stow alacritty mocp nsxiv tmux awesome i3 kitty myscripts rofi vscode conky fish lf picom dunst zathura
```

6. for scripts make [symbolic links](https://github.com/Paulobox/.dotfiles/blob/main/myscripts/.myscripts/README.md)

# dependencies fresh install
```
sudo apt update && sudo apt install -f git stow zsh dunst unclutter imagemagick alacritty moc nsxiv tmux zsh awesome i3 kitty rofi conky fish lf neofetch picom redshift systemd xfce4 xinput gimp gpg pass zathura zoxide wget alsa-utils flameshot gpick libnotify -y
```
<details><summary>arch</summary>
sudo pacman -Syu --needed git libnotify imagemagick stow alacritty dunst tmux zsh unclutter awesome kitty rofi conky fish lf nsxiv neofetch picom redshift systemd xf86-input-libinput gimp gnupg pass zathura zoxide wget alsa-utils eza flameshot gpick python-pip --noconfirm
</details>

---

# [oh-my-zsh](https://ohmyz.sh/), zsh-syntax-highlighting, sh-autosuggestions, powerlevel10k
```
cd ~
sudo rm -rf ~/.oh-my-zsh
echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sleep 4
sudo rm -rf ~/.config/zsh/.zshrc
sudo ln -s ~/.dotfiles/zsh/.zshrc ~/.config/zsh/
```
#### change shell to zsh
```
chsh -s $(which zsh)
```

<!--
#### load .zshrc
```
cd ~
rm -rf ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
rm -rf ~/.oh-my-zsh/themes/alanpeabody.zsh-theme
ln -s ~/.dotfiles/zsh/.oh-my-zsh/themes/alanpeabody.zsh-theme ~/.oh-my-zsh/themes/alanpeabody.zsh-theme
zsh
source ~/.zshrc
```
-->

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [Nala](https://github.com/volitank/nala)
```
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
sudo apt update && sudo apt install nala -y
```

# [Eza](https://github.com/eza-community/eza)
```
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install eza -y
```
<details><summary>arch</summary>
pacman -S eza
</details>

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
<details><summary>NerdFonts</summary>
  
```
cd /usr/share/fonts
sudo mkdir -p NerdFonts
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
sudo unzip Hack.zip -d NerdFonts/HackNF && sudo rm -f Hack.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip
sudo unzip CascadiaCode.zip -d NerdFonts/CascadiaCodeNF && sudo rm -f CascadiaCode.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CodeNewRoman.zip
sudo unzip CodeNewRoman.zip -d NerdFonts/CodeNewRomanNF && sudo rm -f CodeNewRoman.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
sudo unzip FiraCode.zip -d NerdFonts/FiraCodeNF && sudo rm -f FiraCode.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Lilex.zip
sudo unzip Lilex.zip -d NerdFonts/LilexNF && sudo rm -f Lilex.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip -d NerdFonts/JetBrainsMonoNF && sudo rm -f JetBrainsMono.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
sudo unzip Meslo.zip -d NerdFonts/MesloNF && sudo rm -f Meslo.zip
sudo curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip
sudo unzip NerdFontsSymbolsOnly.zip -d NerdFonts/SymbolaNF && sudo rm -f NerdFontsSymbolsOnly.zip
sudo fc-cache -f
```
</details>

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [Awesome WM](https://awesomewm.org/)
```
sudo mkdir -p ~/.config/awesome
cd ~/.config/awesome
sudo git clone --depth=1 https://github.com/streetturtle/awesome-wm-widgets
sudo git clone --depth=1 https://github.com/lcpz/lain
sudo rm -rf /usr/share/awesome/themes/default/background.png
sudo ln -s ~/.dotfiles/awesome/.config/awesome/background.png /usr/share/awesome/themes/default/background.png
```
```
sudo apt install alsa-utils light -y
sudo chgrp video /sys/class/backlight/*/brightness
sudo chmod 664 /sys/class/backlight/*/brightness
sudo usermod -a -G video $USER
light -N 1
```

<details>
<summary><b>Keybindings</b></summary>

| Keybinding            | Description                              |
| --------------------- | ---------------------------------------- |
| `Mod+shift+enter`     | open terminal                            |
| `ctrl+mod+r`          | Restart awesomewm                        |
| `Mod+b`               | Toggle bar                               |
| `Mod+shift+c`         | close                                    |
| `Mod+m`               | maximize                                 |

</details>

# [GoLang](https://go.dev/)
```
cd ~/Downloads
curl -LO https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
rm -rf go1.22.2.linux-amd64.tar.gz
```

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [NEOVIM](https://neovim.io/)
##### Neovim Installation
```
cd /usr/local
sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar xfv nvim-linux64.tar.gz && sudo rm -rf nvim-linux64.tar.gz
sudo rm -rf /usr/local/bin/nvim
sudo ln -s /usr/local/nvim-linux64/bin/nvim /usr/local/bin/nvim
```
##### [my config](https://github.com/Paulobox/nvim) for Nvim
```
rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim
cd ~/.config
rm -rf nvim
sudo apt install -f npm ripgrep python3-venv python3.12-venv -y
git clone https://github.com/Paulobox/nvim
```

<details><summary>arch</summary>

```
rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim
cd ~/.config
rm -rf nvim
sudo pacman -Syu npm ripgrep python-virtualenv --noconfirm
git clone https://github.com/Paulobox/nvim
```

</details>

##### [vimv](https://github.com/thameera/vimv) (batch rename)
```
mkdir -p ~/.local/bin/
curl https://raw.githubusercontent.com/thameera/vimv/master/vimv > ~/.local/bin/vimv && chmod +755 ~/.local/bin/vimv
```

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [tgpt](https://github.com/aandrew-me/tgpt) + [Piper](https://github.com/rhasspy/piper)
```
sudo curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin
cd ~/Downloads
curl -LO https://github.com/rhasspy/piper/releases/download/v1.2.0/piper_amd64.tar.gz
tar xf piper_amd64.tar.gz && rm -rf piper_amd64.tar.gz
cd piper
curl -LO https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_GB/vctk/medium/en_GB-vctk-medium.onnx?download=true
curl -LO https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_GB/vctk/medium/en_GB-vctk-medium.onnx.json?download=true
```
###### check my script for tgpt+piper <a href="https://github.com/Paulobox/.dotfiles/blob/main/myscripts/.myscripts/ask">[ask]</a>

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [Rofi](https://github.com/davatorium/rofi) (Program Launcher)

### [CALCULATOR](https://github.com/svenstaro/rofi-calc)
<details><summary>debian apt</summary>
  
```
cd ~/.config/rofi
sudo apt install -f rofi-dev qalc libtool libtool-bin libglib2.0-dev libglib2.0-0 libglib2.0-bin libcairo2-dev -y
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc/
mkdir m4
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install
libtool --finish /usr/lib/x86_64-linux-gnu/rofi//
```
</details>

<details><summary>arch</summary>

```
sudo pacman -S rofi-calc --noconfirm
```
</details>

### [CLIPMENU](https://github.com/cdown/clipmenu)
<details><summary>debian apt</summary>

```
sudo rm -rf /usr/local/bin/clipmenu
cd ~/.config/rofi
sudo apt install -f xsel libxfixes-dev -y
git clone https://github.com/cdown/clipnotify
git clone https://github.com/cdown/clipmenu
cd clipnotify
sudo make install
cd ../clipmenu
sudo make install
export CM_LAUNCHER=rofi
```
</details>

<details><summary>arch</summary>

```
sudo pacman -S xsel clipnotify clipmenu --noconfirm
export CM_LAUNCHER=rofi
```
</details>

<details><summary>note awesome-wm for clipmenu</summary>
Start daemon. In awesomewm I added this line to rc.lua <br>
-- Autostart Applications <br>
awful.spawn.with_shell("clipmenud")
</details> 

<br>

### [WIFI-MENU](https://github.com/ericmurphyxyz/rofi-wifi-menu) eric's rofi script
```
sudo pacman -S --needed networkmanager curl
mkdir -p ~/.local/bin/
cd ~/.local/bin
curl -o rofi-wifi-menu https://raw.githubusercontent.com/ericmurphyxyz/rofi-wifi-menu/master/rofi-wifi-menu.sh
cd rofi-wifi-menu
chmod +x rofi-wifi-menu
bash "./rofi-wifi-menu"
```

### [POWERMENU](https://github.com/jluttine/rofi-power-menu) jluttine's rofi script
```
mkdir -p ~/.local/bin/
cd ~/.local/bin
curl -O https://raw.githubusercontent.com/Paulobox/rofi-power-menu/master/rofi-power-menu
chmod +x rofi-power-menu
bash "./rofi-power-menu"
```



<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

<!-- EMOJI (to work need 1.7.5 rofi) -->
<!-- install rofi 1.7.5 from source --> 
<!-- sudo apt install libgdk-pixbuf2.0-dev libstartup-notification0-dev libpango1.0-dev libxcb-xkb-dev libxkbcommon-x11-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-cursor-dev libxcb-randr0-dev libxcb-xinerama0-dev check cmake -->
<!-- git clone https://github.com/Mange/rofi-emoji -->

# [fzf](https://github.com/junegunn/fzf)
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
echo -e "y\ny\ny" | ~/.fzf/install && \
source ~/.zshrc
```
#### [ytfzf](https://github.com/pystardust/ytfzf)
```
sudo apt install jq mpv -y
cd ~/Downloads
git clone https://github.com/pystardust/ytfzf
cd ytfzf
sudo make install doc
```

# [tmux](https://github.com/tmux/tmux/wiki) + [tpm](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf
```

ctrl + b + I (to install tmux plugins via tpm)
<br>

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [lf](https://github.com/gokcehan/lf) (terminal-based file manager)

[yay](https://github.com/Jguer/yay)

```
yay -S --needed ueberzug bat lynx mediainfoatool man odt2txt gpg gnome-epub-thumbnailer ffmpegthumbnailer --noconfirm
```

- [ueberzug](https://github.com/ueber-devel/ueberzug) for image generation
in [st](https://st.suckless.org/) terminal


<br>

# [Thunar](https://github.com/xfce-mirror/thunar)

#### dependencies (for custom actions)
```
sudo apt update
sudo apt install gnupg2 bc pandoc gettext pinentry-gtk2 python3-pip python3-venv pipx -y
python3 -m venv myenv
source myenv/bin/activate
pip3 install lxml
```
<details><summary>arch</summary>
  
```
sudo pacman -S --needed gnupg pandoc gettext python-pip python-virtualenv ghostscript pandoc zenity bc --noconfirm
python3 -m venv myenv
source myenv/bin/activate
pip3 install lxml
```  
</details>

#### [thunar custom actions](https://gitlab.com/nobodyinperson/thunar-custom-actions)
```
cd ~/Downloads
git clone https://gitlab.com/nobodyinperson/thunar-custom-actions.git
cd thunar-custom-actions
./configure --prefix=$HOME/.local PASSWDFILE=/etc/passwd
make
make install
uca-apply update
```
| Command          | Description          | File pattern                   | Appears if contains |
|------------------| -------------------- | ------------------------------ | ------------------- |
| pkexec thunar %F | open as root         |  *                             | Directories**       | 
| feh --bg-fill %f | set as wallpaper feh |*.jpg;*.jpeg;*.png;*.gif;*.bmp  | All                    |
| chmod +x %f      | make executable      |  *                             | text files, other files|

#### xfce4
- themes  `Qogir-Dark`,`Adwaita-dark`,`Andromeda`
- icons  `Qogir-dark`,`Adwaita`
###### [cattpuccin gtk](https://github.com/catppuccin/gtk)
[yay](https://github.com/Jguer/yay) -S --needed tumbler lxappearance catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-mocha --noconfirm

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [pywall](https://github.com/dylanaraps/pywal)
```
sudo apt install xwallpaper xdotool python3-full python-pip -y
sudo rm -vf /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo pip install pywal
```

<details><summary>arch(please replace with your version python3.x)</summary>

```
sudo pacman -S python-pip xwallpaper xdotool --noconfirm
sudo rm -vf /usr/lib/python3.12/EXTERNALLY-MANAGED
sudo pip install pywal
```
</details>

1. mkdir -p ~/Pictures/wallpapers `store your wallpapers here`
2. use [shufwall script](https://github.com/Paulobox/.dotfiles/blob/main/myscripts/.myscripts/shufwall) `to randomly choose wallpaper`

<br>
<details><summary>pywall for dwm status-bar for pywall colors(window manager)</summary>

***please edit your dwm.c***
```
XRDB_LOAD_COLOR("dwm.color0", normbordercolor);
XRDB_LOAD_COLOR("dwm.color8", selbordercolor);
XRDB_LOAD_COLOR("dwm.color0", normbgcolor);
XRDB_LOAD_COLOR("dwm.color6", normfgcolor);
XRDB_LOAD_COLOR("dwm.color0", selfgcolor);
XRDB_LOAD_COLOR("dwm.color14", selbgcolor);
```
</details>

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

# [dwm](https://suckless.org/)

<details open><summary>dwm installation</summary>
<br>

<details><summary> <b>debian dependencies</b> </summary>

```
sudo apt install -f build-essential libxrandr-dev libx11-dev libxft-dev libxcb-res0-dev libx11-xcb-dev libxinerama-dev libharfbuzz-dev libfreetype6-dev libfontconfig1-dev xcompmgr xwallpaper -y
```

<!--
cd ~/Downloads
git clone --depth=1 https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si --noconfirm
-->

</details>

<details><summary> <b>arch dependencies</b> </summary>

```
sudo pacman -S base-devel libx11 libxft libxinerama freetype2 fontconfig xcompmgr xwallpaper --noconfirm
```

<!--
cd ~/Downloads
git clone --depth=1 https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si --noconfirm
-->

</details>


<details><summary> <b><a href="https://github.com/Paulobox/dwm">my dwm config</a> install </b></summary>
  
```
mkdir -p ~/Downloads/Suckless-org
cd ~/Downloads/Suckless-org
git clone https://github.com/Paulobox/suckless-software
cd suckless-software

cd dwm
sudo make clean install

cd ../dmenu
sudo make clean install

cd ../st
sudo make clean install

cd ../slstatus
sudo make clean install
```
</details>

<details><summary> <b>dwm install orignal</b> </summary>

```
mkdir -p ~/Downloads/Suckless
cd ~/Downloads/Suckless
git clone --depth=1 https://git.suckless.org/dwm
git clone --depth=1 https://git.suckless.org/st
git clone --depth=1 https://git.suckless.org/dmenu

cd dwm
sudo make clean install

cd ../st
make
sudo make clean install

cd ../dmenu
sudo make clean install
```

</details>

<details><summary> <b>oneliner for dwm.desktop entry</b> </summary>

```
echo -e "[Desktop Entry]\nName=dwm\nComment=dynamic window manager\nExec=dwm\nTryExec=/usr/local/bin/dwm\nIcon=dwm\nType=Application" | sudo tee /usr/share/xsessions/dwm.desktop > /dev/null && cat /usr/share/xsessions/dwm.desktop
```

</details></details>

---

<br><br><br>

# Other 🐧 Linux commands
<a id="no bios beeping"></a>
#### no bios beeping (disable laptop's speaker for annoying bios beeps in linux)
```
echo "blacklist pcspkr" | sudo tee -a /etc/modprobe.d/blacklist.conf
echo "blacklist snd_pcsp" | sudo tee -a /etc/modprobe.d/blacklist.conf
sudo rmmod pcspkr
```

#### disable bell
```
echo 'set bell-style none' >> $HOME/.inputrc
```

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

### choose default Terminal
```
sudo update-alternatives --config x-terminal-emulator
```
#### change shell to zsh
```
chsh -s $(which zsh)
```
#### change terminal to kitty (xfce)
```
echo "TerminalEmulator=kitty" >> ~/.config/xfce4/helpers.rc
```
### fix debianos is not in the sudoers file.

1. `su`
2. `sudo visudo`
3. find line `(add user under User privilege specification)`
4. add your user `yourUsername    ALL=(ALL:ALL) ALL`


### fix time
```
sudo apt-get install ntp -y
timedatectl set-ntp true
sudo timedatectl set-timezone Europe/London
timedatectl
sudo timedatectl set-local-rtc 0
sudo systemctl restart ntp
sudo ntpd -q -g
sudo hwclock --systohc
timedatectl
```

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>

## Mouse Scroll
sudo apt install xinput <br>
arch: sudo pacman -S xorg-xinput
<br>
enabling instructions <br>
//Terminal// <br>
xinput list choose your mouse mine is id=10 <br>
↳ Logitech G305  id=14	[slave  pointer  (2)] <br><br>

finally: <br>
```
xinput set-prop 14 "libinput Scroll Method Enabled" 0, 0, 1 
```

<br><br>

# asciiquarium
```
cd /tmp
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.6.tar.gz
tar -zxvf Term-Animation-2.6.tar.gz
cd Term-Animation-2.6
perl Makefile.PL &&  make &&   make test
sudo make install
```
cd /tmp

---

<details><summary><h2>More Stuff luke's dwmblocks etc etc</h2></summary>

## mount windows ntfs
```
sudo pacman -S ntfs-3g
sudo mount -t ntfs-3g -o ro /dev/nvme1n1p3 /mnt
```

## sudoers file
```
your_username ALL=(ALL) NOPASSWD: ALL
```

## apt-secure fix
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87015Fyourkeyhere980
```

### LukeSmithxyz statusbar (dwmblocks scripts)
```
mkdir -p ~/.local/bin/statusbar
cd ~/.local/bin/statusbar
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/LukeSmithxyz/voidrice/contents/.local/bin/statusbar | grep "download_url" | awk -F '"' '{print $4}' | xargs -n 1 curl -O -L
```
  
### dwmBlocks
```
sudo apt update
sudo apt install git build-essential libx11-dev
cd dwmblocks
make
sudo make clean install
```

### removing orphaned pacakges
```
sudo pacman -Qdtq | sudo pacman -Rns -
```

### Bluetooth
```
go install github.com/darkhz/bluetuith@latest
```

<hr/><hr/><hr/><hr/>
</details>
<br>

<div align="right">
  <br>
  <a href="#paulius-dotfiles-"><kbd> <br> ▲ <br> </kbd></a>
</div>
