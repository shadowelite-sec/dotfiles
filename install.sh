#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"
YELLOW="\e[33m"
MAGENTA="\e[35m"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"

oldunst(){

	cd /bin/
	sudo rm dunst*
	sudo sudo wget https://github.com/shadowelite-sec/scripts/raw/main/dunst/dunst
	sudo wget https://github.com/shadowelite-sec/scripts/raw/main/dunst/dunstify
	sudo wget https://raw.githubusercontent.com/shadowelite-sec/scripts/main/dunst/dunstctl
	sudo chmod +x /bin/dunst*
}

mpd_fix(){
	mkdir ~/.config/mpd/playlists
	mkdir ~/Music
}

git_cfg(){
	git config --global user.email "alansedp@gmail.com"
	git config --global user.name "shadowelite"
	git config --global credential.helper store
	git config --global core.editor nvim
}


#install depen*

echo -e "${RED}Installing Dependencies....${END}"

sudo pacman -Syy && sudo pacman -S --noconfirm archlinux-keyring xorg xorg-xinit sxhkd polybar rofi picom kitty zsh feh flameshot wget dunst mugshot mpv aria2 piper jq sxiv lolcat bat noto-fonts-emoji fzf npm brightnessctl zathura xclip python3 python-pip neovim mpd ncmpcpp imagemagick xautolock xdotool mpc npm i3lock net-tools bluez bluez-utils pulseaudio-bluetooth pulsemixer stow unzip zip gzip p7zip xf86-input-libinput ntfs-3g slop shotgun maim zbar 

#install old dusnt
oldunst
mpd_fix
git_cfg

#clear

#make config dir``

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
sudo pacman -S --noconfirm cmus cmatrix ranger telegram-desktop firefox thunar 

#yay pkg
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S mugshot bspwm-rounded-corners cava toilet bluez-hciconfig bluez-hcitool android-bash-completion web-greeter 

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
#sudo npm install -g @duhdugg/emocli
echo "Done 🐉"
#backlight auto
sudo cp -r rc.local /etc/
sudo chmod 777 /etc/rc.local
sudo bash -c "echo "_JAVA_AWT_WM_NONREPARENTING=1" >>/etc/environment"
sudo bash -c "echo "gtk-application-prefer-dark-theme=1" >> /usr/share/gtk-3.0/settings.ini"
fc-cache -f -v 2>/dev/null
echo "${BOLDGREEN}ALL DONE${END}"

read -p "Installation Finshed, Do You Want To Reboot Your System Now ?! " yn

case $yn in
	yes ) echo system rebooting in 5 sec ....;;
	no ) echo skiping...;
		exit;;
	* ) echo invalid selection;
		exit 1;;
esac
sleep 5
reboot
