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
echo -e "\n${RED}Installing Dependencies....${END}"

sudo apt update -y && sudo apt install bspwm sxhkd polybar rofi picom kitty zsh feh flameshot mpv aria2 jq sxiv fzf -y
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
if [[ -d "$FDIR" ]]
then
	cp -rf $DIR/.local/share/fonts/* "$FDIR"
else
	mkdir -p "$FDIR"
	cp -rf $DIR/.local/share/fonts/* "$FDIR"
fi


#cp all configs
echo -e "\n${GREEN}Copying Config Files....${END}"
cp -r config/* ~/.config


#wall
echo -e "\n${GREEN}Copying walls....${END}"
cp -r wall/ ~/Pictures/


#additionl pkgs

sudo apt install cava cmus cmatrix 

#Install zsh
function run(){

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

#cp .zshrc ~/
#cp -r .oh-my-zsh ~/
}

echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.zshrc

