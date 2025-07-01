# Bealers' dotfiles - macOS Setup

## Prerequisites

- Homebrew installed
- Git installed
- 1Password app (v8+) installed and signed in

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
brew install bash starship lsd bat fzf tldr zellij neovim stow
brew install --cask ghostty 1password-cli font-jetbrains-mono-nerd-font

# Add Homebrew bash to allowed shells and set as default
sudo bash -c 'echo "/opt/homebrew/bin/bash" >> /etc/shells'
chsh -s /opt/homebrew/bin/bash
```

### 3. Set up fzf shell integration
```bash
/opt/homebrew/opt/fzf/install --all
```

### 4. Set up dotfiles with stow
```bash
stow -t ~ bash
stow -t ~ starship
stow -t ~ ghostty
stow -t ~ nvim
stow -t ~ 1password
stow -t ~ cursor
```

### 5. Configure 1Password CLI
```bash
# Sign in to 1Password CLI
eval $(op signin)

# Test the integration
op account list
```

### 6. Set up MCP config (Cursor)
```bash
# Copy the template and fill in your secrets:
cp ~/.cursor/mcp.dist.json ~/.cursor/mcp.json
# Edit ~/.cursor/mcp.json and add your API keys and tokens.
# mcp.json is gitignored and should never be committed.
```

### 7. Set up SSH for GitHub
```bash
# (If using 1Password SSH agent, ensure it's enabled in 1Password settings)
# If using a dumped key, copy it to ~/.ssh/id_rsa and set permissions:
chmod 600 ~/.ssh/id_rsa

# Add your public key to GitHub if not already done
cat ~/.ssh/id_rsa.pub

# Change your git remote to use SSH:
git remote set-url origin git@github.com:bealers/dotfiles.git
```

### 8. Install and configure Ghostty
- Ghostty is installed via Homebrew. Launch it and configure as needed.
- Font troubleshooting: If you see font warnings, check the font family in Ghostty's config and use `ghostty +list-fonts | grep -i jetbrains` to find the correct name.

## Notes
- Alacritty config has been archived in this branch.
- All tools are installed via Homebrew for easy updates.
- 1Password CLI and SSH agent integration are recommended for secure SSH key management.