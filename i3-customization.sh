#!/bin/bash

#===================================================#
# Autor: jirrezdex                                  #
# Github: https://github.com/jirrezdex/archlinux-i3 #
# Script feito por leo.arch                         #
# Github: https://github.com/leoarch/arch-install   #
#===================================================#

# instalando yay (AUR)
cd ~/
mkdir yaygit
cd yaygit
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz 
tar -xvzf yay.tar.gz && cd yay && makepkg -si

pacman -S ark compton dunst expac fakeroot feh git i3-gaps jshon notify-osd rofi scrot sddm termite tumbler p7zip unzip zip --noconfirm
yay -S polybar ttf-font-awesome-4 --noconfirm

echo -e "${_g}===> Baixar os arquivos da configuração e acessando os arquivos de configurações${_o}"; sleep 1
git clone https://github.com/jirrezdex/archlinux-i3.git && cd archlinux-i3

echo -e "${_g}===> Mover os arquivos do ~/.config/i3 e dar permissão${_o}"; sleep 1
if [-d "${HOME}/.config/dunst"]; then
	rm -dR ~/.config/i3
else
	mv i3/ ~/.config
	chmod +x ~/.config/i3/basico.sh
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/polybar e dar permissão${_o}"; sleep 1
if [-d "${HOME}/.config/dunst"]; then
	sudo rm -dR ~/.config/polybar
else
	mv polybar/ ~/.config
	chmod +x ~/.config/polybar/launch.sh
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/dunst${_o}"; sleep 1
if [-d "${HOME}/.config/dunst"]; then
	sudo rm -dR ~/.config/dunst
else
	mv dunst/ ~/.config
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/rofi${_o}"; sleep 1
if [-d "${HOME}/.config/dunst"]; then
	sudo rm -dR ~/.config/rofi
else
	mv rofi/ ~/.config
	mv .dex.rasi ~
fi

echo -e "${_g}===> Mover os arquivos do ~/Imagens${_o}"; sleep 1
if [-d "${HOME}/Imagens"]; then
	if [-e "${HOME}/Imagens/W1.png"]; then
		sudo rm -dR ~/Imagens/W1.png
	fi
	mv W1.png ~/Imagens
else
	mkdir ~/Imagens
	mv W1.png ~/Imagens
fi

echo -e "${_g}===> Mover os arquivos do /etc/xdg/termite${_o}"; sleep 1
sudo rm -dR /etc/xdg/termite
sudo mv termite/ /etc/xdg/

echo -e "${_g}===> Criar diretórios necessários${_o}"; sleep 1
mkdir ~/Imagens/Screenshots

















