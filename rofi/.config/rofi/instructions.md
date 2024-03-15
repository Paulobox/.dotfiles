CALCULATOR:
sudo apt install rofi-dev qalc libtool libtool-bin
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc/
mkdir m4
autoreconf -i
mkdir build
cd build/
../configure
make
sudo make install

WIFI-MENU
git clone https://github.com/ericmurphyxyz/rofi-wifi-menu.git
cd rofi-wifi-menu
bash "./rofi-wifi-menu.sh"
sudo ln -s "$(pwd)/rofi-wifi-menu.sh" /usr/local/bin/wifimenu

CLIPMENU
install clipnotify
git clone https://github.com/cdown/clipnotify
git clone https://github.com/cdown/clipmenu
cd clipnotify
sudo make install
cd ../clipmenu
sudo make install
sudo ln -s "$(pwd)/clipmenu" /usr/local/bin

add to your window manager daemon mine is awesomewm so i added this line to rc.lua
-- Autostart Applications
awful.spawn.with_shell("clipmenud")



//////////////////////////////////////////////////////
<!-- EMOJI (to work need 1.7.5 rofi) -->
<!-- install rofi 1.7.5 from source --> 
<!-- sudo apt install libgdk-pixbuf2.0-dev libstartup-notification0-dev libpango1.0-dev libxcb-xkb-dev libxkbcommon-x11-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-cursor-dev libxcb-randr0-dev libxcb-xinerama0-dev check cmake -->
<!-- git clone https://github.com/Mange/rofi-emoji -->



