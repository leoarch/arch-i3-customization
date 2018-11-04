#!/bin/bash

#===================================================================#
# Autor do tema: > jirrezdex <                                      #
# Github do Autor: https://github.com/jirrezdex/archlinux-i3        #
# Script feito por > leoarch <                                      #
# Github Autor do Script : https://github.com/leoarch/arch-install  #
#===================================================================#

# cores
_g="\e[32;1m";_o="\e[m"

echo -e "${_g}===> Pacotes necessários para instalar yay (AUR)${_o}"; sleep 1
sudo pacman -S git --noconfirm

# instalando yay (AUR)
echo -e "${_g}===> Instalando yay (AUR)${_o}"; sleep 1
cd ${HOME}
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo -e "${_g}===> Instalando pacotes essenciais para o funcionamento do sistema${_o}"; sleep 1
sudo pacman -S ark compton dunst fakeroot feh git gvfs i3-gaps notify-osd p7zip rofi scrot terminus-font termite ttf-dejavu ttf-font-awesome tumbler unziz zip --noconfirm

echo -e "${_g}===> Instalando polybar e font-awesome-4${_o}"; sleep 1
yay -S polybar ttf-font-awesome-4 --noconfirm

echo -e "${_g}===> Baixar os arquivos da configuração e acessando os arquivos de configurações${_o}"; sleep 1
git clone https://github.com/leoarch/archlinux-i3.git && cd archlinux-i3

# i3
if [ -d "${HOME}/.config/i3" ]; then
	echo -e "${_g}===> Removendo diretório i3${_o}"; sleep 1
	rm -rf ~/.config/i3
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/i3 e dar permissão${_o}"; sleep 1
mv i3/ ~/.config
chmod +x ~/.config/i3/basico.sh

# polybar
if [ -d "${HOME}/.config/polybar" ]; then
	echo -e "${_g}===> Removendo diretório polybar${_o}"; sleep 1
	sudo rm -rf ~/.config/polybar
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/polybar e dar permissão${_o}"; sleep 1
mv polybar/ ~/.config
chmod +x ~/.config/polybar/launch.sh

# dunst
if [ -d "${HOME}/.config/dunst" ]; then
	echo -e "${_g}===> Removendo diretório dunst${_o}"; sleep 1
	sudo rm -rf ~/.config/dunst
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/dunst${_o}"; sleep 1
mv dunst/ ~/.config

# rofi
if [ -d "${HOME}/.config/rofi" ]; then
	echo -e "${_g}===> Removendo diretório rofi${_o}"; sleep 1
	sudo rm -rf ~/.config/rofi
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/rofi${_o}"; sleep 1
mv rofi/ ~/.config
mv .dex.rasi ~

# imagens
if [ -d "${HOME}/Imagens" ]; then
	echo -e "${_g}===> Removendo diretório Imagens${_o}"; sleep 1
	sudo rm -rf ~/Imagens
fi

echo -e "${_g}===> Mover os arquivos do ~/Imagens${_o}"; sleep 1
mkdir ~/Imagens
mv W1.png ~/Imagens

# termite
if [ -d "/etc/xdg/termite" ]; then
	echo -e "${_g}===> Removendo diretório termite${_o}"; sleep 1
	sudo rm -rf /etc/xdg/termite
fi

echo -e "${_g}===> Mover os arquivos do /etc/xdg/termite${_o}"; sleep 1
sudo mv termite/ /etc/xdg/

echo -e "${_g}===> Criar diretórios necessários${_o}"; sleep 1
mkdir ~/Imagens/Screenshots

echo -e "${_g}===> Apagando pasta do git${_o}"; sleep 1
sudo rm -rf ~/archlinux-i3