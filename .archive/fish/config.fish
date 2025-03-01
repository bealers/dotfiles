# Set path first
fish_add_path ~/.local/bin

alias ls='ls --color=auto -Fhla --group-directories-first'
alias vi='nvim'
alias vim='nvim'

alias ll='ls -la'
alias l='ls -l'

alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias h='history'
#alias md='mkdir -p'
#alias rd='rmdir'
#alias df='df -h'


if status is-interactive
    # Disable default Oh My Posh key handler
    set --global --export POSH_DISABLE_KEYHANDLER true

    # Initialize Oh My Posh with minimal config
    oh-my-posh init fish --config="$HOME/.local/share/oh-my-posh/themes/dracula.omp.json" | source
end
