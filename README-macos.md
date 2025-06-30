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

# Terminal utilities
brew install lsd bat fzf tldr zellij neovim stow

# Fonts
brew install --cask font-jetbrains-mono-nerd-font

# Add bash to allowed shells and set as default
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
```

### 3. Set up fzf shell integration

```bash
# Install fzf shell integration
/opt/homebrew/opt/fzf/install --all
```

### 4. Set up dotfiles with stow

```bash
# Set up the symlinks for each component
stow -t ~ bash
stow -t ~ starship
stow -t ~ alacritty
stow -t ~ nvim
stow -t ~ 1password
stow -t ~ cursor
```

### 5. Restart your terminal

After setting bash as your default shell, restart your terminal or open a new session to see the changes.

## Installed Tools

- **bash** - Modern bash shell (5.2+)
- **starship** - Fast, customizable prompt
- **lsd** - Modern ls with colors and icons
- **bat** - Better cat with syntax highlighting
- **fzf** - Fuzzy finder for command line
- **tldr** - Simplified man pages
- **zellij** - Terminal multiplexer
- **neovim** - Modern vim
- **stow** - Symlink manager for dotfiles

## Next Steps

- [x] Install fonts
- [x] Install additional tools (lsd, bat, fzf, tldr, zellij)
- [ ] Configure Alacritty
- [ ] Set up Neovim

## Notes

- This setup uses bash 5.2+ from Homebrew instead of the default macOS bash 3.2
- All tools are installed via Homebrew for easy updates
- The `macos` branch contains macOS-specific configurations
- Fonts are installed via Homebrew cask for easy updates
- fzf is configured with shell integration for fuzzy finding 