## dependencies

### Debian:
```
sudo apt install dwm suckless-tools pamixer xcompmgr build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev libx11-dev libxinerama-dev libxft-dev libx11-xcb-dev libxcb-res0-dev -y
```

<details><summary>Arch Linux</summary>

```
sudo pacman -S dwm base-devel libx11 libxft libxinerama freetype2 fontconfig pamixer xcompmgr --noconfirm
``` 
</details>

---

## DOWNLOADS

- window manager (dwm)

```
git clone https://git.suckless.org/dwm 
```

- searchbar (dmenu)

```
git clone https://git.suckless.org/dmenu
```

- st terminal

```
git clone https://git.suckless.org/st
```

- status bar (slstatus)

```
git clone https://git.suckless.org/slstatus
```

---

#### dwm-config.h
```
static const char *prtscrcmd[] = { "flameshot", "gui", NULL};
{ 0,			        XK_Print,  spawn,	   {.v = prtscrcmd } },
```


### create entry /usr/share/xsessions/ dwm.desktop
<details><summary>old might not work</summary>

```
[Desktop Entry]
Name=dwm
Comment=dynamic window manager
Exec=dwm
TryExec=/usr/local/bin/dwm
Icon=dwm
Type=Application
```

`oneliner for dwm.desktop:`
```
echo -e "[Desktop Entry]\nName=dwm\nComment=dynamic window manager\nExec=dwm\nTryExec=/usr/local/bin/dwm\nIcon=dwm\nType=Application" | sudo tee /usr/share/xsessions/dwm.desktop > /dev/null && cat /usr/share/xsessions/dwm.desktop
```

<br><br>

copy .xinitrc  
```
cp /etc/X11/xinit/xinitrc ~/.xinitrc            
```
or make file .xinitrc in home directroy and add:

```
xcompmgr &
exec dwm
```
---
---
---
</details>
