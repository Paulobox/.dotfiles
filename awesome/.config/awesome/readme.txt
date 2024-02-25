sudo apt install alsa-utils

sudo apt install light
sudo chgrp video /sys/class/backlight/*/brightness
sudo chmod 664 /sys/class/backlight/*/brightness
sudo usermod -a -G video $USER
light -N 1

git clone https://github.com/streetturtle/awesome-wm-widgets
git clone https://github.com/lcpz/lain


enable mouse scroll
sudo apt install xinput

//Terminal//
xinput list choose your mouse mine is id=10
↳ Logitech G305  id=10	[slave  pointer  (2)]

finally:
xinput set-prop 10 "libinput Scroll Method Enabled" 0, 0, 1
