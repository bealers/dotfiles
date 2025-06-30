# Bealers' dotfiles - macOS Setup

## Prerequisites

- Homebrew installed
- Git installed
- 1Password app installed

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

# Terminal emulator
brew install --cask ghostty

# 1Password CLI
brew install --cask 1password-cli

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
stow -t ~ ghostty
stow -t ~ nvim
stow -t ~ 1password
stow -t ~ cursor
```

### 5. Configure Cursor MCP (optional)

```bash
# Install MCP servers if needed
npm install -g @abhiz123/todoist-mcp-server

# Edit the MCP configuration with your API keys
# The template is at ~/.cursor/mcp.json
# Update paths and API keys as needed
```

### 6. Restart your terminal

After setting bash as your default shell, restart your terminal or open a new session to see the changes.

### 7. Sign in to 1Password CLI

```bash
# Sign in to your 1Password account
eval $(op signin)

# Test the integration
op account list
op --help
```

**Note:** The `eval $(op signin)` command will prompt you for your 1Password account details and authenticate you. This is required for the shell integration to work properly.

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
- **1password-cli** - Command line access to 1Password
- **ghostty** - Fast, modern terminal emulator

## Font Troubleshooting

If you see a warning like:
```
[WARN] Unable to load specified font ... falling back to Menlo
```
it means the terminal can't find the font family. Try the following steps:

1. **For Ghostty, try these common family names:**
   ```lua
   font-family = JetBrainsMono Nerd Font Mono
   -- or
   font-family = JetBrainsMono Nerd Font
   -- or
   font-family = JetBrainsMonoNL Nerd Font Mono
   ```
2. **Find the exact family name:**
   - Run: `ghostty +list-fonts | grep -i jetbrains`
   - Use the family name shown.
3. **Validate fonts in Font Book:**
   - Open Font Book, search for "JetBrains", and check the "Family" name.
   - Right-click and choose "Validate Font" to check for errors.
4. **Reinstall the font if needed:**
   ```bash
   brew uninstall --cask font-jetbrains-mono-nerd-font
   brew install --cask font-jetbrains-mono-nerd-font
   ```
5. **Restart Ghostty after each change.**

## 1Password Troubleshooting

If you encounter issues with 1Password integration:

1. **Check if 1Password CLI is installed:**
   ```bash
   which op
   op --version
   ```

2. **Sign in to 1Password CLI:**
   ```bash
   eval $(op signin)
   ```

3. **Verify your account is active:**
   ```bash
   op account list
   ```

4. **Test shell integration:**
   ```bash
   # Start a new shell session
   bash
   # Try tab completion with op commands
   op <TAB>
   ```

5. **Check 1Password configuration:**
   ```bash
   cat ~/.config/op/config
   ```

6. **If you get permission errors, ensure the 1Password app is running and you're signed in there too.**

## Next Steps

- [x] Install fonts
- [x] Install additional tools (lsd, bat, fzf, tldr, zellij)
- [x] Install 1Password CLI
- [x] Set up Cursor MCP configuration
- [x] Install and configure Ghostty
- [ ] Test complete setup
- [ ] Set up Neovim

## Notes

- This setup uses bash 5.2+ from Homebrew instead of the default macOS bash 3.2
- All tools are installed via Homebrew for easy updates
- The `macos` branch contains macOS-specific configurations
- Fonts are installed via Homebrew cask for easy updates
- fzf is configured with shell integration for fuzzy finding
- 1Password CLI provides shell integration and command line access
- Cursor MCP configuration uses template files - update with your actual API keys
- Ghostty provides fast, modern terminal emulation with excellent font support 