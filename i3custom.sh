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
git clone https://github.com/jirrezdex/archlinux-i3.git && cd archlinux-i3

# i3
if [ -e "${HOME}/.config/i3/config" ]
then
	echo -e "${_g}===> Removendo arquivo /i3/config${_o}"; sleep 1
	rm -rf ~/.config/i3/config
elif [ -e "${HOME}/.config/i3/basico.sh" ]
then
	echo -e "${_g}===> Removendo arquivo /i3/basico.sh${_o}"; sleep 1
	rm -rf ~/.config/i3/basico.sh
fi

echo -e "${_g}===> Movendo os arquivos do ~/.config/i3 e dar permissões${_o}"; sleep 1
mv i3/ ~/.config
chmod +x ~/.config/i3/basico.sh

# polybar
if [ -e "${HOME}/.config/polybar/config" ]; then
	echo -e "${_g}===> Removendo arquivo /polybar/config${_o}"; sleep 1
	sudo rm -rf ~/.config/polybar/config
elif [ -e "${HOME}/.config/polybar/launch.sh" ]; then
	echo -e "${_g}===> Removendo arquivo /polybar/launch.sh${_o}"; sleep 1
	rm -rf ~/.config/polybar/launch.sh
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/polybar e dar permissão${_o}"; sleep 1
mv polybar/ ~/.config
chmod +x ~/.config/polybar/launch.sh

# dunst
if [ -e "${HOME}/.config/dunst/dunstrc" ]; then
	echo -e "${_g}===> Removendo arquivo /dunst/dunstrc${_o}"; sleep 1
	sudo rm -rf ~/.config/dunst/dunstrc
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/dunst${_o}"; sleep 1
mv dunst/ ~/.config

# rofi
if [ -e "${HOME}/.config/rofi/config" ]
then
	echo -e "${_g}===> Removendo arquivo /rofi/config${_o}"; sleep 1
	sudo rm -rf ~/.config/rofi/config
fi

echo -e "${_g}===> Mover os arquivos do ~/.config/rofi${_o}"; sleep 1
mv rofi/ ~/.config

# .dex.rasi
if [ -e "${HOME}/.dex.rasi" ]
then
	echo -e "${_g}===> Removendo arquivo .dex.rasi${_o}"; sleep 1
	sudo rm -rf ~/.dex.rasi
fi

mv .dex.rasi ~

# imagens
if [ ! -d "${HOME}/Imagens" ]
then
	echo -e "${_g}===> Criando diretório /Imagens${_o}"; sleep 1
	mkdir ~/Imagens
elif [ ! -e "${HOME}/Imagens/W1.png" ]
then
	mv W1.png ~/Imagens
fi

# termite
if [ -e "/etc/xdg/termite/config" ]
then
	echo -e "${_g}===> Removendo arquivo /termite/config${_o}"; sleep 1
	sudo rm -rf /etc/xdg/termite/config
fi

echo -e "${_g}===> Mover os arquivos do /etc/xdg/termite${_o}"; sleep 1
sudo mv termite/ /etc/xdg/

echo -e "${_g}===> Criar diretórios necessários${_o}"; sleep 1
if [ ! -d "${HOME}/Imagens/Screenshots" ]
then
	mkdir ~/Imagens/Screenshots
fi

echo -e "${_g}===> Apagando pasta do git${_o}"; sleep 1
sudo rm -rf ~/archlinux-i3