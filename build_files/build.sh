#!/bin/bash

set -ouex pipefail

# Copie des fichiers système du dépôt vers /
cp -avf "/ctx/system_files"/. /

### Dépôt COPR pour l'écosystème Hyprland (fork compatible Fedora 44)
dnf5 -y copr enable lionheartp/Hyprland

### Installation de TES paquets
dnf5 -y install \
    hyprland \
    xdg-desktop-portal-hyprland \
    waybar \
    rofi-wayland \
    swaync \
    hyprlock \
    hypridle \
    hyprpaper \
    polkit-gnome \
    grim \
    slurp \
    brightnessctl \
    pavucontrol \
    kitty \
    zsh \
    starship \
    zoxide \
    eza \
    bat \
    ripgrep \
    fd-find \
    jetbrains-mono-nerd-fonts \
    fontawesome-fonts \
    noto-fonts-emoji

### Désactivation du COPR
dnf5 -y copr disable lionheartp/Hyprland

### Services système
systemctl enable podman.socket
