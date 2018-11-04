#!/bin/bash

#===================================================================#
# Autor do tema: > jirrezdex <                                      #
# Github do Autor: https://github.com/jirrezdex/archlinux-i3        #
# Script feito por > leoarch <                                      #
# Github Autor do Script : https://github.com/leoarch/arch-install  #
#===================================================================#

echo -e "${_g}===> Pacotes necessários para instalar PACKER (AUR)${_o}"; sleep 1
sudo pacman -S git jshon expac --noconfirm

echo -e "${_g}===> Instalando gerenciador AUR (PACKER)${_o}"; sleep 1
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD\?h\=packer PKGBUILD
makepkg
sudo pacman -U packer-*.pkg.tar.xz

pacman -S ark compton dunst expac fakeroot feh git gvfs i3-gaps jshon notify-osd p7zip rofi scrot terminus-font termite ttf-dejavu ttf-font-awesome tumbler unzip xorg-xrandr zip

packer -S polybar ttf-font-awesome-4  --noconfirm

echo -e "${_g}===> Baixar os arquivos da configuração e acessando os arquivos de configurações${_o}"; sleep 1
git clone https://github.com/leoarch/archlinux-i3.git

echo -e "${_g}===> Entrando na pasta arch-i3-customization${_o}"; sleep 1
cd archlinux-i3

# i3
echo -e "${_g}===> Mover os arquivos do ~/.config/i3 e dar permissão${_o}"; sleep 1

if [ -d "${HOME}/.config/i3" ]; then
	rm -dR ~/.config/i3
fi

mv i3/ ~/.config
chmod +x ~/.config/i3/basico.sh

# polybar 
echo -e "${_g}===> Mover os arquivos do ~/.config/polybar e dar permissão${_o}"; sleep 1

if [ -d "${HOME}/.config/polybar" ]; then
	sudo rm -dR ~/.config/polybar
fi

mv polybar/ ~/.config
chmod +x ~/.config/polybar/launch.sh

# dunst
echo -e "${_g}===> Mover os arquivos do ~/.config/dunst${_o}"; sleep 1

if [ -d "${HOME}/.config/dunst" ]; then
	sudo rm -dR ~/.config/dunst
fi

mv dunst/ ~/.config

# rofi
echo -e "${_g}===> Mover os arquivos do ~/.config/rofi${_o}"; sleep 1

if [ -d "${HOME}/.config/rofi" ]; then
	sudo rm -dR ~/.config/rofi
fi

mv rofi/ ~/.config
mv .dex.rasi ~

# imagens
echo -e "${_g}===> Mover os arquivos do ~/Imagens${_o}"; sleep 1

if [ -d "${HOME}/Imagens" ]; then
	sudo rm -dR ~/Imagens
fi

mkdir ~/Imagens
mv W1.png ~/Imagens

# termite
echo -e "${_g}===> Mover os arquivos do /etc/xdg/termite${_o}"; sleep 1

if [ -d "/etc/xdg/termite" ]; then
	sudo rm -dR /etc/xdg/termite
fi

sudo mv termite/ /etc/xdg/

echo -e "${_g}===> Criar diretórios necessários${_o}"; sleep 1
mkdir ~/Imagens/Screenshots

echo -e "${_g}===> Apagando pasta do git${_o}"; sleep 1
sudo rm -dR ~/archlinux-i3

















