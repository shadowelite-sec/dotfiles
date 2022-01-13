#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"
YELLOW="\e[33m"
MAGENTA="\e[35m"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"

#dirs

DIR=`pwd`
FDIR="$HOME/.local/share/fonts"

#install depen*

echo -e "${RED}Installing Dependencies....${END}"

sudo apt update -y && sudo apt install bspwm sxhkd polybar rofi picom kitty zsh feh flameshot mpv aria2 jq sxiv fzf python3-pip xhk libx11-dev libxrex-dev libxext-dev brightnessctl libnotify-bin notify-osd notification-daemon -y
clear

#make config dir

if [ -f ~/.config ]
then
	mkdir ~/.config
else
	echo -e "\n${RED}File already exist. skiping....${END}"
fi


#Installing Fonts
echo -e "\n${YELLOW}Installing fonts...${END}"
if [ -d "$FDIR" ]
then
	cp -rf $DIR/.local/share/fonts/* "$FDIR"
else
	mkdir -p "$FDIR"
	cp -rf $DIR/.local/share/fonts/* "$FDIR"
fi

#Install local bin
echo -e "\n${GREEN}Copying local bin${END}"
cp -r .local/bin ~/.local/

#cp all configs
echo -e "\n${GREEN}Copying Config Files....${END}"
cp -r config/* ~/.config


#wall
echo -e "\n${GREEN}Copying walls....${END}"
cp -r wall/ ~/Pictures/


#additionl pkgs

echo "${YELLOW}Installing additional pkgs....${END}"
sudo apt install cava cmus cmatrix -y

#pip3 modules

pip3 install pywal ueberzug


#Install zsh
function run(){
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
}
run

echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.zshrc

