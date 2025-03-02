# Bealers' dotfiles 

```bash
# install GNU stow
sudo pacman -S stow 

cd ~/.local
git clone git@github.com:bealers/dotfiles.git
cd dotfiles

# set up the symlinks for each one
stow -t ~ bash
stow -t ~ alacritty

# etc
```