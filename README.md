# Bealers' dotfiles 

```bash 
# terminal, window manager & prompt
sudo pacman -S alacritty zellij starship

# replacements
sudo pacman -S lsd bat

# apps
sudo pacman -S neovim stow

yay -S appimagelauncher 1password cheat tldr
```

```bash 
cd ~/.local
git clone git@github.com:bealers/dotfiles.git
cd dotfiles
```

```bash 
# set up the symlinks for each one
stow -t ~ bash
stow -t ~ nvim
stow -t ~ alacritty
stow -t ~ starship
stow -t ~ claude-desktop
```

```bash 
stow -t ~ appimagelauncher
systemctl --user enable appimagelauncherd
systemctl --user start appimagelauncherd
systemctl --user status appimagelauncherd
```

```bash 
stow -t ~ 1password
systemctl --user enable 1password.service
systemctl --user start 1password.service
systemctl --user status 1password.service
```

```bash 
# enable JetBrains mono Nerdfont
stow -t ~ fonts && fc-cache -fv
```

```bash 
# keyboard shortcuts
./bin/gnome-settings.sh
```