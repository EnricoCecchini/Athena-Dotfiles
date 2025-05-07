if status is-interactive
    # Commands to run in interactive sessions can go here

neofetch --ascii Athena-Dotfiles/fish/custom_ascii.txt

# Set background color
set -g fish_color_background 235	# Background Color
set -g fich_color_normal 255		# Set text color to white
set -g fish_color_command cyan		# Set command color to green


# Use OhMyPosh
oh-my-posh init fish --config Athena-Dotfiles/oh-my-posh/config.toml | source

end
