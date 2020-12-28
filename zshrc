# Environment variables
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ..="cd .."
alias vim="nvim"
alias ls="ls -alF"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias pt="python -m pytest"
alias va="source venv/bin/activate > /dev/null 2>&1"
alias vd="deactivate"

case `uname` in
  Darwin)
    alias ctags="`brew --prefix`/bin/ctags"
  ;;
esac

# Quit ranger and keep the current directory
alias ran='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1
then
  eval "$(pyenv init -)"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Show git branch in prompt
branch() {
  git symbolic-ref --short -q HEAD 2>/dev/null
}
setopt PROMPT_SUBST
PROMPT='%~ %F{green}$(branch)%f%# '
autoload -Uz compinit && compinit
