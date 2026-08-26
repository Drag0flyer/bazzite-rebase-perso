#!/bin/bash

set -ouex pipefail

# Copie des fichiers système du dépôt vers /
cp -avf "/ctx/system_files"/. /

### Dépôt COPR pour l'écosystème Hyprland
dnf5 -y copr enable solopasha/hyprland

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
dnf5 -y copr disable solopasha/hyprland

### Services système
systemctl enable podman.socket
