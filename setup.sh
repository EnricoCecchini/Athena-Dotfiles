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
sudo packman -S kitty fish rofi stow thunar github-cli


# Link config files
echo "Stowing config files..."
stow --target=$HOME kitty fish rofi thunar

# Set fish as default shell if not already
echo "Setting up fish as default shell..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
    echo "Default shell changed to fish. Log out and back in to apply."
fi

# Install Utilities
echo "Installing Utilities"
echo "Making utils folder"
mkdir ~/Utils

# Installing yay
echo "Installing yay"
cd ~/Utils
git clone https://aur.archlinux.org/yay.git
cd ~/Utils/yay
makepkg -sri

# Install VS Code
echo "Installing VS Code"
cd ~/Utils
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd ~/Utils/visual-studio-code-bin
makepkg -sri
