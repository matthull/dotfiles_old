alias zshrc='$EDITOR $HOME/.zshrc && . $HOME/.zshrc'
alias reload_dotfiles='. $HOME/.bootstrap && . $HOME/.zshrc'
alias rld='reload_dotfiles'
autoload -U zmv
alias mmv='noglob zmv -W'
