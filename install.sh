#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"
YELLOW="\e[33m"
MAGENTA="\e[35m"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"

#install depen*

echo -e "${RED}Installing Dependencies....${END}"

sudo apt update -y && sudo apt install bspwm sxhkd polybar rofi picom kitty zsh feh flameshot mpv aria2 piper jq sxiv fzf npm xhk fonts-lohit-mlym libx11-dev libxext-dev brightnessctl libnotify-bin notify-osd notification-daemon dunst zathura xclip python3 python3-pip neovim mpd ncmpcpp thermald xautolock xdotool i3lock stow -y
#clear

#make config dir

if [ -f ~/.config ]
then
	mkdir ~/.config
else
	echo -e "\n${RED}File already exist. skiping....${END}"
fi

#Install local 
echo -e "\n${GREEN}Copying Config Files....${END}"
stow */

#additionl pkgs

echo "${YELLOW}Installing additional pkgs....${END}"
sudo apt install cava cmus cmatrix ranger telegram-desktop -y

#nvim plug

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#pip3 modules
sleep 0.5

pip3 install pywal ueberzug

#install pywalfox

sudo pip install pywalfox
pywalfox install

#install emoji
sleep 0.5
sudo npm install -g @duhdugg/emocli
echo "Done 🐉"
#backlight auto
sudo cp -r rc.local /etc/

sudo chmod 777 /etc/rc.local

echo "${BOLDGREEN}ALL DONE${END}"
