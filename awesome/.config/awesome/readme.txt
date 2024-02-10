sudo apt install alsa-utils

sudo apt install light
sudo chgrp video /sys/class/backlight/*/brightness
sudo chmod 664 /sys/class/backlight/*/brightness
sudo usermod -a -G video $USER
light -N 1

git clone https://github.com/streetturtle/awesome-wm-widgets
git clone https://github.com/lcpz/lain

