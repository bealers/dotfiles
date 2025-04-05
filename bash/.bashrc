# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto -Fhla --group-directories-first'
alias ls='lsd -Flh'
alias cat='bat'

alias grep='grep --color=auto'

alias vi='nvim'
alias vim='nvim'
alias nano='nvim'

# more to come here
alias ddt='ddev exec tail -f storage/logs/laravel.log'

# -----

export EDITOR=nvim

export PATH="$PATH:/home/bealers/.local/bin"
export PATH="$PATH:/home/bealers/.config/composer/vendor/bin/"
export PATH="$PATH:/home/bealers/.foundry/bin"

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pnpm, may delete
export PNPM_HOME="/home/bealers/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Better history management
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s cmdhist

# Fish-like history search with arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Enable Starship prompt
eval "$(starship init bash)"
