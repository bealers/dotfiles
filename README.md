# Bealers' dotfiles 

```bash
# install terminal goodness
sudo pacman -S alacritty zellij starship 

# apps (last two may need isntalling manually, or with yay)
sudo pacman -S neovim stow appimagelauncher 1password

cd ~/.local
git clone git@github.com:bealers/dotfiles.git
cd dotfiles

# set up the symlinks for each one
stow -t ~ bash
stow -t ~ alacritty
stow -t ~ starship

stow -t ~ appimagelauncher
systemctl --user enable appimagelauncherd
systemctl --user start appimagelauncherd
systemctl --user status appimagelauncherd

stow -t ~ 1password
systemctl --user enable 1password.service
systemctl --user start 1password.service
systemctl --user status 1password.service

# todo neovim

# enable JetBrains mono Nerdfont
stow -v fonts && fc-cache -fv

# keyboard shortcuts
./bin/gnome-settings.sh
```