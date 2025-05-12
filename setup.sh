#!/bin/bash

# Get the absolute path to the current working directory
current_dir=$(pwd)

# Define the expected path of your Dotfiles folder
dotfiles_dir="$HOME/Athena-Dotfiles"

# Check if the script is already running from inside the Dotfiles directory
if [ "$current_dir" != "$dotfiles_dir" ]; then
    echo "You are not in the Dotfiles directory. Please run this script from inside the Dotfiles folder."
    exit 1
fi

echo "Beginning Setup"

# Install recquired packages
echo "Installing packages..."
sudo pacman -S neovim kitty fish rofi stow thunar github-cli steam

# Intstall NVIDIA Utils
echo "Installing Nvidia Utils..."
sudo pacman -S lib32-nvidia-utils

# Link config files
echo "Stowing config files..."
stow --target=$HOME kitty fish rofi thunar

# Set fish as default shell if not already
echo "Setting up fish as default shell..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
    echo "Default shell changed to fish. Log out and back in to apply."
fi

# Reload Terminal
exec fish

# Install Utilities
echo "Installing Utilities"
echo "Making utils folder"
mkdir -p ~/Utils

# Installing yay
echo "Installing AUR helper `yay`"
cd ~/Utils
git clone https://aur.archlinux.org/yay.git
cd ~/Utils/yay
makepkg -sri --noconfirm

# Install VS Code
echo "Installing VS Code"
cd ~/Utils
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd ~/Utils/visual-studio-code-bin
makepkg -sri --noconfirm

# Install librewolf
flatpak install flathub io.gitlab.librewolf-community

# Install VLC
flatpak install flathub org.videolan.VLC

# Install Spotify
flatpak install flathub com.spotify.Client

# Install Bottles
flatpak install flathub com.usebottles.bottles

# Install Libre Office
flatpak install flathub org.libreoffice.LibreOffice

# Install Plex Desktop Client
flatpak install flathub tv.plex.PlexDesktop

# Install LACT (GPU Manager)
flatpak install flathub io.github.ilya_zlobintsev.LACT

# Install Beekeeper
flatpak install flathub io.beekeeperstudio.Studio
