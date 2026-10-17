#!/bin/bash

set -ouex pipefail

# Copie des fichiers système du dépôt vers /
cp -avf "/ctx/system_files"/. /

### Activation des dépôts COPR valides
dnf5 -y copr enable lionheartp/Hyprland
dnf5 -y copr enable atim/starship
dnf5 -y copr enable che/nerd-fonts

### Paquets remplacés par Noctalia — conservés temporairement comme référence
# hyprpolkitagent
# dunst
# hyprlauncher
# waybar
# hyprlock
# hypridle
# hyprpaper

### Résolution du conflit Xwayland spécifique à Bazzite / Terra
# Remplace le paquet Xwayland de Terra par le paquet Fedora standard requis par Hyprland
dnf5 -y swap terra-xorg-x11-server-Xwayland xorg-x11-server-Xwayland --allowerasing

### Installation des paquets via DNF
dnf5 -y install \
  noctalia \
  hyprland \
  hyprland-guiutils \
  xdg-desktop-portal-hyprland \
  swappy \
  NetworkManager-tui \
  grim \
  slurp \
  brightnessctl \
  pavucontrol \
  kitty \
  zsh \
  zoxide \
  eza \
  bat \
  ripgrep \
  fd-find \
  fontawesome-fonts \
  google-noto-emoji-fonts \
  nerd-fonts \
  gcc-c++ \
  neovim \
  starship

### Désactivation des dépôts COPR
dnf5 -y copr disable lionheartp/Hyprland
dnf5 -y copr disable atim/starship
dnf5 -y copr disable che/nerd-fonts

### Services système
systemctl enable podman.socket
