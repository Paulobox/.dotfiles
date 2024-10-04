## just export path without symbolic links: (add it to .zshrc)
```
export PATH="$PATH:$(find ~/.dotfiles/myscripts -type d | paste -sd ':' -)"
```

<br><br><br>

## 1. make all files executable
```
chmod u+x ~/.dotfiles/myscripts/.myscripts
```

## 2. create symbolic links to /usr/local/bin
```
ls -p ~/.dotfiles/myscripts/.myscripts | grep -v -e 'README.md' -e 'emojis/' -e 'pythonscripts/' | xargs -I {} sudo ln -s ~/.myscripts/{} /usr/local/bin/
```
<details><summary>create symbolic links and overwrite</summary>
  
```
sudo sh -c 'for file in *; do ln -sf "$(realpath "$file")" "/usr/local/bin/$file"; done'
```
</details>

<details><summary>remove broken links</summary>

```
find /usr/local/bin -xtype l ! -exec test -e {} \; -delete
```
</details>

<br>

#### stow .local/bin/ and export status-bar scripts for dwm(window manager)
```
cd ~/.dotfiles
stow .local/
chmod u+x ~/.local/bin/statusbar/*
export PATH="$HOME/.local/bin/statusbar:$PATH"
```

##### [LF](https://github.com/gokcehan/lf) (file manager) + [Überzug](https://github.com/ueber-devel/ueberzug) image viewer lukesmith'z setup
```
chmod x ~/.config/lf/cleaner
chmod x ~/.config/lf/scope
```

---
---
---
---
---
---
---


# Other Scripts

### remove all pngs in current directory

```
rm -rf ./*.png
```

## Converting from jpg to webp in current directory
<details><summary>jpg to webp 70%</summary>

```bash
for file in ./*.jpg; do cwebp "$file" -q 70 -o "${file%.jpg}.webp"; done
```

</details>


## Converting from png to webp in current directory
<details><summary>png to webp 70%</summary>

```bash
for file in ./*.png; do cwebp "$file" -q 70 -o "${file%.png}.webp"; done
```

</details>

<hr />

## Image 2 slide video

<details><summary>file duration to pic.txt</summary>

```bash
for f in *.webp ; do echo "file '$f'\nduration 1" ; done > pics.txtfor f in *.webp ; do echo "file '$f'\nduration 1" ; done > pics.txt
```

</details>

<details><summary>download audio from yt</summary>

```bash
yt-dlp -f bestaudio "https://www.youtube.com/watch?v=somevideoid"
```

</details>


<details><summary>convert to ogg format</summary>

```bash
ffmpeg -i music.webm music.ogg
```

</details>

<details><summary>img2slide</summary>

```bash
ffmpeg -f concat -safe 0 -i pics.txt -i music.ogg -vf "scale=min(iw\,1920):min(ih\,1080):force_original_aspect_ratio=decrease,pad=1920:1080:(1920-iw)/2:(1080-ih)/2:black" -c:v libx264 -crf 18 -r 30 -shortest -y ./output.mp4
```

</details>
<hr />

### enable mouse scroll

```
xinput set-prop 14 "libinput Scroll Method Enabled" 0, 0, 1
```

<details><summary>write .iso to usb</summary>


```
dd if=archlinux-2024.iso of=/dev/sdb status=progress
```

</details>
