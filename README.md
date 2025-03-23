# Bealers' dotfiles 

```bash
# install terminal goodness
sudo pacman -S alacritty zellij starship 

# apps
sudo pacman -S neovim stow

cd ~/.local
git clone git@github.com:bealers/dotfiles.git
cd dotfiles

# set up the symlinks for each one
stow -t ~ bash
stow -t ~ alacritty
stow -t ~ starship

# todo
# neovim

# enables JetBrains mono Nerdfont
stow -v fonts && fc-cache -fv

# keyboard shortcuts
./bin/gnome-settings.sh
```
