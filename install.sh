#!/bin/bash


#install depen*

sudo apt update -y && sudo apt install bspwm sxhkd polybar dmenu picom xfce4-terminal feh -y

#make config dir
if [ -f ~/.config ]
then
	mkdir ~/.config
else
	echo -e "\nFile already exist. skiping..."
fi

#cp all configs
cp -r config/* ~/.config

#wall

cp -r wall/ ~/Pictures/


