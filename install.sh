#!/bin/bash

# Function to safely create symlink
create_symlink() {
    source=$1
    target=$2

    # Remove existing symlink or file
    if [ -L "$target" ] || [ -f "$target" ]; then
        rm "$target"
    elif [ -d "$target" ]; then
        rm -rf "$target"
    fi

    # Create symlink
    ln -sf "$source" "$target"
    echo "Linked: $source -> $target"
}

# Create necessary directories
mkdir -p ~/.config/fish/functions
mkdir -p ~/.local/share/oh-my-posh/themes
mkdir -p ~/.config/nvim

# Create symlinks with safety checks
create_symlink ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
create_symlink ~/dotfiles/oh-my-posh/themes/dracula.omp.json ~/.local/share/oh-my-posh/themes/dracula.omp.json

# Handle nvim config files
for f in ~/dotfiles/nvim/.config/nvim/*; do
    if [ -e "$f" ]; then
        target=~/.config/nvim/$(basename "$f")
        create_symlink "$f" "$target"
    fi
done

# Link fish functions
for f in ~/dotfiles/fish/functions/*; do
    if [ -f "$f" ]; then
        target=~/.config/fish/functions/$(basename "$f")
        create_symlink "$f" "$target"
    fi
done

echo "Dotfiles installed successfully!"
