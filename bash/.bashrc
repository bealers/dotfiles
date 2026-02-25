# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto -Fhla --group-directories-first'
alias ls='lsd -Flha'
alias cat='bat'

alias grep='grep --color=auto'

alias vi='nvim'
alias vim='nvim'
alias nano='nvim'

# -----

export EDITOR=nvim

export PATH="$PATH:/home/bealers/.local/bin"

# Enable Starship prompt
eval "$(starship init bash)"
