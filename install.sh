#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"
YELLOW="\e[33m"
MAGENTA="\e[35m"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"

#install depen*
echo -e "\n${RED}Installing Dependencies....${END}"

sudo apt update -y && sudo apt install bspwm sxhkd polybar dmenu picom kitty zsh feh -y

#make config dir

if [ -f ~/.config ]
then
	mkdir ~/.config
else
	echo -e "\n${RED}File already exist. skiping....${END}"
fi

#cp all configs
echo -e "\n${GREEN}Copying Config Files....${END}"
cp -r config/* ~/.config

#Install zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .zshrc ~/
cp -r .oh-my-zsh ~/


#wall
echo -e "\n${GREEN}Copying walls....${END}"
cp -r wall/ ~/Pictures/


