#!/bin/bash

set -ouex pipefail

# Copie des fichiers système du dépôt vers /
cp -avf "/ctx/system_files"/. /

### Activation des dépôts COPR valides
dnf5 -y copr enable lionheartp/Hyprland
dnf5 -y copr enable atim/starship

### Installation des paquets via DNF
dnf5 -y install \
    hyprland \
    hyprland-guiutils \
    xdg-desktop-portal-hyprland \
    hyprpolkitagent \
    dunst \
    hyprlauncher \
    waybar \
    swaync \
    hyprlock \
    hypridle \
    hyprpaper \
    polkit-kde \
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
    starship

### Désactivation des dépôts COPR
dnf5 -y copr disable lionheartp/Hyprland
dnf5 -y copr disable atim/starship

### Services système
systemctl enable podman.socket
