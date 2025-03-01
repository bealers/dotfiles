# dotfiles 
```bash
# install GNU stow
sudo pacman -S stow 

cd ~/.local
git clone git@github.com:bealers/dotfiles.git
cd dotfiles

# set up the symlinks for bash
stow -t ~ bash

# etc
```

