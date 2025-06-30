# Bealers' dotfiles - macOS Setup

## Prerequisites

- Homebrew installed
- Git installed

## Installation Steps

### 1. Clone the repository
```bash
cd ~
git clone git@github.com:bealers/dotfiles.git
cd dotfiles
git checkout macos
```

### 2. Install core tools via Homebrew

```bash
# Terminal and shell
brew install bash
brew install starship

# Fonts
brew install --cask font-jetbrains-mono-nerd-font

# Add bash to allowed shells and set as default
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
```

### 3. Set up dotfiles with stow

```bash
# Install stow if not already installed
brew install stow

# Set up the symlinks for each component
stow -t ~ bash
stow -t ~ starship
stow -t ~ alacritty
stow -t ~ nvim
stow -t ~ 1password
stow -t ~ cursor
```

### 4. Restart your terminal

After setting bash as your default shell, restart your terminal or open a new session to see the changes.

## Next Steps

- [x] Install fonts
- [ ] Install additional tools (lsd, bat, fzf, tldr, zellij)
- [ ] Configure Alacritty
- [ ] Set up Neovim

## Notes

- This setup uses bash 5.2+ from Homebrew instead of the default macOS bash 3.2
- All tools are installed via Homebrew for easy updates
- The `macos` branch contains macOS-specific configurations
- Fonts are installed via Homebrew cask for easy updates 