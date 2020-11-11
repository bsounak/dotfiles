# Environment variables
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ..="cd .."
alias vim="nvim"
alias ctags="`brew --prefix`/bin/ctags"
alias ls="ls -alF"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias pt="python -m pytest"
alias va="source venv/bin/activate > /dev/null 2>&1"
alias vd="deactivate"

# Quit ranger and keep the current directory
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

eval "$(pyenv init -)"

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

branch() {
  git symbolic-ref --short -q HEAD 2>/dev/null
}
setopt PROMPT_SUBST
PROMPT='%~ %F{green}$(branch)%f%# '

autoload -Uz compinit && compinit
