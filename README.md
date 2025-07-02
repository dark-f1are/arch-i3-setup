# Arch Linux i3 Window Manager Setup Script

## Overview

A streamlined setup script for Arch Linux that installs and configures i3 window manager along with essential tools for a productive development environment.

## i3 Configuration

The i3 configuration uses `Mod4` (the Windows key) as the primary modifier key. Keybindings are organized into separate files for clarity.

- **Mod Key:** `Mod4` (Windows key)
- **Terminal:** Alacritty
- **Launcher:** Rofi
- **File Manager:** Thunar
- **Browser:** Firefox (default, user selectable during setup)
- **Code Editor:** VS Code
- **Text Editor:** Mousepad
- **Font:** JetBrainsMono Nerd Font 8 (increased from 6 for better readability)
- **i3lock:** Improved readability of the lock command in `startup.conf`.

## Package Management

The script installs packages defined in `packages.txt` (Arch repositories) and `yay_packages.txt` (AUR). These files can be easily customized to fit your needs.

### Default Package Groups

The default package lists include:

#### Core & System
- htop, exa, bat, alacritty
- i3-wm, i3blocks, i3status-rust
- fastfetch
- Bluetooth utilities
- Network management

#### File Management
- Thunar with plugins
- Archive support (zip, unzip, unrar)
- Device mounting support (gvfs)

#### UI & Theming
- Rofi (application launcher)
- Dunst (notifications)
- Flameshot (screenshots)
- Custom fonts and icons
- Theme packages
- i3lock-color (AUR)
- Visual Studio Code (AUR)

## Prerequisites

- Fresh Arch Linux installation (Xorg Installaion)
- Internet connection
- Non-root user with sudo privileges
- Git (to clone this repository)
- yay (AUR helper) will be installed automatically for AUR packages

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/dark-f1are/arch-i3-setup.git
   cd arch-i3-setup
   ```

2. Run the setup script:
   ```bash
   ./setup.sh
   ```

3. During installation, you'll be prompted to:
   - Configure Git (optional)
   - Select a web browser
   - Enter sudo password when required

## What the Script Does

1. Performs system checks
2. Sets up Git configuration (optional)
3. Installs yay AUR helper
4. Lets you choose and install a web browser
5. Installs all required packages (including AUR packages: i3lock-color, visual-studio-code-bin)
6. Sets up system services (bluetooth, display manager)
7. Creates basic directory structure
8. Creates symbolic links for configuration files (dotfiles) from the cloned repository to your home directory.
9. Configures input devices

## Post-Installation

After installation completes:
1. Reboot your system
2. Log in through ly display manager
3. i3 will start automatically
4. Use $mod+Return for terminal
5. Use $mod+d for application launcher

## Troubleshooting

- Check the log file created at `~/setup_[timestamp].log`
- Ensure all required files are present before running
- Verify internet connection
- Make sure script is run from correct directory

## Contributing

Feel free to submit issues and pull requests for:
- Bug fixes
- New features
- Documentation improvements
- Configuration enhancements
