#!/usr/bin/env bash
set -euo pipefail

# bootstrap-ubuntu-server.sh
# Minimal server setup for Ubuntu 24.04 LXC containers
# Deploys bealers dotfiles (server branch)

DOTFILES_REPO="git@github.com:bealers/dotfiles.git"
DOTFILES_DIR="$HOME/.local/dotfiles"
DOTFILES_BRANCH="ubuntu-server"

echo "==> Installing base packages..."
sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends \
    git \
    curl \
    stow \
    unzip \
    build-essential

echo "==> Installing neovim (latest AppImage)..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz

echo "==> Installing lsd..."
LSD_VERSION=$(curl -s https://api.github.com/repos/lsd-rs/lsd/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
curl -LO "https://github.com/lsd-rs/lsd/releases/latest/download/lsd_${LSD_VERSION#v}_amd64.deb"
sudo dpkg -i "lsd_${LSD_VERSION#v}_amd64.deb"
rm "lsd_${LSD_VERSION#v}_amd64.deb"

echo "==> Installing bat..."
BAT_VERSION=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
curl -LO "https://github.com/sharkdp/bat/releases/latest/download/bat_${BAT_VERSION#v}_amd64.deb"
sudo dpkg -i "bat_${BAT_VERSION#v}_amd64.deb"
rm "bat_${BAT_VERSION#v}_amd64.deb"

echo "==> Installing starship..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes

echo "==> Cloning dotfiles (branch: $DOTFILES_BRANCH)..."
if [ -d "$DOTFILES_DIR" ]; then
    echo "    Dotfiles already present, pulling latest..."
    git -C "$DOTFILES_DIR" pull
else
    git clone -b "$DOTFILES_BRANCH" "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo "==> Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow -t ~ bash
stow -t ~ nvim
stow -t ~ starship

echo "==> Done. Reload your shell: source ~/.bashrc"
echo "    Neovim will install plugins on first launch (LazyVim)"
