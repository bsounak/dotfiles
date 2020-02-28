# Environment variables
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ..="cd .."
alias vi="nvim"
alias vim="nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias ctags="`brew --prefix`/bin/ctags"
alias r="ranger"
alias ls="ls -alF"
alias jn="jupyter notebook"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

vf(){
  vim $(fzf)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
