# Bealers' dotfiles

Two branches:
- `master` — Arch/desktop (Omarchy), manual setup
- `ubuntu-server` — Ubuntu 24.04 LXC containers, scripted setup (you are here)

## Ubuntu server setup

### Prerequisites

These dotfiles clone via SSH. Before running the bootstrap script you need SSH agent forwarding enabled from your local machine.

On your laptop, add to `~/.ssh/config`:

```
Host <server-ip>
    ForwardAgent yes
```

1Password is used as the SSH agent on the local machine. Make sure the 1Password SSH agent is enabled (**Settings → Developer → SSH Agent**) and you're connected to the server via a session that has forwarding active.

Test it's working from the server:

```bash
ssh -T git@github.com
# Should return: Hi bealers! You've authenticated...
```

### Bootstrap

Run this once on a fresh Ubuntu 24.04 LXC container as your normal user (with sudo):

```bash
curl -sS https://raw.githubusercontent.com/bealers/dotfiles/ubuntu-server/scripts/bootstrap-ubuntu-server.sh | bash
```

Then reload your shell:

```bash
source ~/.bashrc
```

Neovim (LazyVim) will install its plugins on first launch — just run `nvim` and wait for it to complete.

### What gets installed

- `neovim` (latest, via tarball)
- `lsd` (ls replacement)
- `bat` (cat replacement)
- `starship` (prompt)

### What gets stowed

- `bash/` — `.bashrc` with aliases, editor exports, starship init
- `nvim/` — LazyVim config
- `starship/` — prompt config

### Updating

```bash
cd ~/.local/dotfiles
git pull
cd ~/.local/dotfiles
stow -t ~ bash
stow -t ~ nvim
stow -t ~ starship
```
