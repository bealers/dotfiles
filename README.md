# Bealers' dotfiles

Two branches:
- `master` — Arch/desktop (Omarchy), manual setup
- `ubuntu-server` — Ubuntu 24.04 LXC containers, scripted setup (you are here)

## Ubuntu server setup

### Prerequisites

These dotfiles clone via SSH. You need SSH agent forwarding from your local machine so GitHub auth works on the server without copying keys there.

**1. Ensure 1Password SSH agent is running on your laptop**

In 1Password: **Settings → Developer → SSH Agent** — must be enabled.

Make sure your shell has the agent socket exported. Add to your laptop's `~/.bashrc` if not already present:

```bash
export SSH_AUTH_SOCK=/home/bealers/.1password/agent.sock
```

Verify it's working:

```bash
ssh-add -l
# Should list your keys
```

**2. Add ForwardAgent to your laptop's `~/.ssh/config`**

```
Host *
  IdentityAgent /home/bealers/.1password/agent.sock

Host <server-ip>
    ForwardAgent yes
```

**3. Always SSH in with `-A`**

```bash
ssh -A bealers@<server-ip>
```

Then verify forwarding works from the server:

```bash
ssh -T git@github.com
# Should return: Hi bealers! You've authenticated...
```

### Bootstrap

Once SSHed in with `-A`, run:

```bash
sudo apt-get update -qq && sudo apt-get install -y git
mkdir -p ~/.local
git clone -b ubuntu-server git@github.com:bealers/dotfiles.git ~/.local/dotfiles
bash ~/.local/dotfiles/scripts/ubuntu-server-init.sh
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
stow -t ~ bash
stow -t ~ nvim
stow -t ~ starship
```
