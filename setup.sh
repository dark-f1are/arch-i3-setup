#!/bin/bash

set -e

# Color definitions - simplified and more reliable
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
NC="\033[0m"

# Read package lists from files
PACKAGES=($(<packages.txt))
YAY_PACKAGES=($(<yay_packages.txt))

# Add sudo credential caching
cache_sudo_credentials() {
    echo -e "${YELLOW}Caching sudo credentials...${NC}"
    sudo -v
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &
}

# Simplified functions
check_system() {
    [[ "$(id -u)" == "0" ]] && { echo -e "${RED}Don't run as root${NC}"; exit 1; }
    cache_sudo_credentials || { echo -e "${RED}Failed to cache sudo credentials${NC}"; exit 1; }
    ping -c 1 8.8.8.8 >/dev/null 2>&1 || { echo -e "${RED}No internet connection${NC}"; exit 1; }
    [[ ! -f "./setup.sh" ]] && { echo -e "${RED}Run from correct directory${NC}"; exit 1; }
    for item in "40-libinput.conf" ".bashrc" ".config"; do
        [[ ! -e "$item" ]] && { echo -e "${RED}Missing: $item${NC}"; exit 1; }
    done
}

setup_yay() {
    command -v yay || {
        echo -e "${YELLOW}Setting up yay...${NC}"
        sudo -v  # Refresh sudo credentials before yay installation
        git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
        cd /tmp/yay-bin || return 1
        makepkg -s --noconfirm
        sudo pacman -U --noconfirm ./*.pkg.tar.zst
        cd - || return 1
        rm -rf /tmp/yay-bin
    }
}

install_packages() {
    sudo pacman -Syu --noconfirm || return 1
    sudo pacman -S --noconfirm --needed "${PACKAGES[@]}" || return 1
}

install_yay_packages() {
    echo -e "${YELLOW}Installing AUR packages with yay...${NC}"
    yay -S --noconfirm --needed "${YAY_PACKAGES[@]}" || return 1
}

setup_git() {
    echo -e "${YELLOW}Configure Git? (y/n)${NC}"
    read -r response
    [[ "$response" == [yY] ]] && {
        read -rp "GitHub username: " username
        read -rp "GitHub email: " email
        git config --global user.name "$username"
        git config --global user.email "$email"
    }
}

install_browser() {
    echo -e "${YELLOW}Select browser:\n1) Firefox\n2) Chromium\n3) Brave\n4) Skip${NC}"
    read -rp "Choice [1-4]: " choice
    case $choice in
        1) sudo pacman -S --noconfirm firefox ;;
        2) sudo pacman -S --noconfirm chromium ;;
        3) yay -S --noconfirm brave-bin ;;
    esac
}

main() {
    echo -e "${CYAN}╔════════ System Setup Installation ════════╗${NC}"

    check_system
    setup_git
    setup_yay
    install_browser
    install_packages
    install_yay_packages

    # Quick setup commands
    # sudo brightnessctl set 3% || true # Uncomment and adjust if you want to set brightness on install
    sudo systemctl enable bluetooth ly.service

    # Create dirs and copy files
    mkdir -p ~/Documents ~/Downloads ~/Pictures ~/Music ~/Videos ~/Projects
    sudo mkdir -p /etc/X11/xorg.conf.d/
    sudo cp 40-libinput.conf /etc/X11/xorg.conf.d/
    ln -sf "$PWD/.bashrc" "$HOME/.bashrc"
    ln -sf "$PWD/.config" "$HOME/.config"
    chmod +x ~/.config/set_random_wallpaper.sh
    # rm -f ~/.bash_profile # Consider if this is always desired; .bashrc is typically used for interactive shells.

    echo -e "${GREEN}Installation Complete! Please reboot.${NC}"
}

main "$@"
