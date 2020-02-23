# Environment variables
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ..="cd .."
alias vi="nvim"
alias vim="nvim"
alias vimrc="vim ~/.config/nvim/init.vim"
alias bashrc="vim ~/.bashrc"
alias r="ranger"
alias ls="ls -alF"


# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function pa(){
  if [ -z $1 ]
  then
    venv="venv"
  else
    venv=$1 
  fi
  pyenv activate venv
}
alias sd="source deactivate"
alias pv="pyenv virtualenvs"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
function vf(){
  vim $(fzf)
}
