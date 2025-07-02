# Arch Linux i3 Window Manager Setup

## Overview

This repository provides a streamlined setup script for Arch Linux, designed to install and configure the i3 window manager along with essential tools for a productive and aesthetically pleasing development environment. While primarily a personal setup, it's structured to be easily customizable and usable by others.

## Features

*   **i3 Window Manager:** Pre-configured with a clean layout, keybindings, and status bar.
*   **Terminal:** Alacritty, a fast, GPU-accelerated terminal emulator.
*   **Application Launcher:** Rofi, for quick application launching, window switching, and emoji selection.
*   **File Manager:** Thunar, with custom actions for convenience.
*   **System Monitoring:** Htop for process management and i3status-rust for a feature-rich status bar.
*   **Modern CLI Tools:** Includes `exa` (ls replacement), `bat` (cat replacement), and `fastfetch`.
*   **Bluetooth Support:** Utilities for managing Bluetooth devices.
*   **Display Manager:** `ly`, a lightweight and minimalist display manager.
*   **Wallpaper Management:** Automated random wallpaper setting with local directory support and online fallback.
*   **Dotfile Management:** Uses symbolic links for configuration files, allowing easy updates and personal customization.
*   **Screen Locking:** `i3lock-color` for a visually appealing lock screen.
*   **Notifications:** Dunst for customizable desktop notifications.
*   **Screenshots:** Flameshot for powerful and easy-to-use screenshot capabilities.
*   **Fonts & Icons:** Pre-configured with JetBrainsMono Nerd Font and Papirus icons.
*   **Text Editor:** Nano with enhanced syntax highlighting and keybindings.

## Key Components & Configurations

*   **i3 Configuration:**
    *   **Mod Key:** `Mod4` (Windows key) is set as the primary modifier key for all i3 keybindings.
    *   **Font:** JetBrainsMono Nerd Font size 8 for improved readability.
    *   **Structure:** Keybindings, startup applications, and workspaces are organized into separate files (`config.d/`) for clarity and easy modification.
*   **Alacritty:** Configured with the Tokyo Night theme and optimized settings for a smooth terminal experience.
*   **i3status-rust:** Provides a comprehensive status bar with modules for CPU, memory, network, battery, and a power menu.
*   **Random Wallpaper Script (`set_random_wallpaper.sh`):**
    *   Prioritizes wallpapers from `~/Pictures/Wallpapers` (if available).
    *   Falls back to fetching random wallpapers from `minimalistic-wallpaper.demolab.com`.
    *   Includes preloading for a seamless experience.
*   **Nano:** Enhanced `nanorc` with improved color schemes and keybindings.
*   **Rofi:** Themed with Tokyo Night colors, offering `drun`, `window`, `filebrowser`, and `emoji` modes.

## Package Management

The setup script leverages two external files for package management, making it easy to customize your installation:

*   `packages.txt`: Contains a list of packages to be installed from the official Arch Linux repositories via `pacman`.
*   `yay_packages.txt`: Contains a list of AUR (Arch User Repository) packages to be installed via `yay` (which the script will install if not present).

You can edit these files directly to add or remove packages according to your preferences before running the setup script.

## Important Note for Beginners

**This script is designed for users who have already completed a basic Arch Linux installation and have an Xorg server set up.** If you used `archinstall` during your Arch Linux setup, selecting the Xorg option will typically fulfill this prerequisite. This script does *not* install Arch Linux itself, nor does it configure the fundamental Xorg display server if it's not already present.

## Prerequisites

Before running the setup script, ensure you have:

*   A fresh Arch Linux installation with an **Xorg server already installed and configured** (e.g., by selecting the Xorg option in `archinstall`).
*   An active internet connection.
*   A non-root user with `sudo` privileges.
*   `git` installed (to clone this repository).

## Installation

1.  **Clone this repository:**
    ```bash
    git clone https://github.com/awtawsif/arch-i3-setup.git
    cd arch-i3-setup
    ```

2.  **Run the setup script:**
    ```bash
    ./setup.sh
    ```

3.  **During installation, you'll be prompted to:**
    *   Configure Git (optional).
    *   Select a web browser from a list of popular options.
    *   Enter your `sudo` password when required for system-level changes.

## What the Script Does

The `setup.sh` script automates the following:

1.  Performs initial system checks (e.g., internet connectivity, user permissions).
2.  Caches `sudo` credentials for a smoother installation process.
3.  Sets up Git configuration (if opted in).
4.  Installs the `yay` AUR helper (if not already present).
5.  Prompts for and installs your preferred web browser.
6.  Installs all core packages listed in `packages.txt` and AUR packages from `yay_packages.txt`.
7.  Enables essential system services (e.g., Bluetooth, `ly` display manager).
8.  Creates standard user directories (`~/Documents`, `~/Downloads`, etc.).
9.  Copies `40-libinput.conf` for input device configuration.
10. **Creates symbolic links** for all configuration files (`.bashrc`, `.config/`) from this repository to your home directory. This ensures your configurations are version-controlled and easily updatable.
11. Sets execute permissions for the wallpaper script.

## Post-Installation

After the script completes:

1.  **Reboot your system:**
    ```bash
    reboot
    ```
2.  **Log in:** You will be greeted by the `ly` display manager. Log in with your user credentials.
3.  **i3 will start automatically.**
4.  **Basic Usage:**
    *   Use `Mod4 + Return` (Windows key + Enter) to open Alacritty terminal.
    *   Use `Mod4 + d` (Windows key + d) to open the Rofi application launcher.

## Customization

*   **Packages:** Modify `packages.txt` and `yay_packages.txt` to tailor the installed software to your needs.
*   **Dotfiles:** Since configurations are symlinked, you can easily modify them directly in your home directory, and these changes will be reflected in the cloned repository. To share your changes or keep them backed up, you can commit and push them to your own fork of this repository.
*   **Wallpaper:** Place your favorite wallpapers in `~/Pictures/Wallpapers` to have the `set_random_wallpaper.sh` script pick from them.

## Troubleshooting

*   **Log File:** Check the log file created at `~/setup_[timestamp].log` for detailed output and errors.
*   **Prerequisites:** Ensure all prerequisites are met before running the script.
*   **Internet Connection:** Verify your internet connection is stable.
*   **Directory:** Make sure you run the script from the root of the cloned repository.

## Contributing

Feel free to submit issues and pull requests for:

*   Bug fixes
*   New features
*   Documentation improvements
*   Configuration enhancements