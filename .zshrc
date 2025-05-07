export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dieter"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

export CMAKE_GENERATOR=Ninja
export QTDIR=$HOME/Qt/6.8.3/gcc_64
export PATH=$QTDIR/bin:$HOME/Qt/Tools/QtCreator/bin:$PATH
export CMAKE_PREFIX_PATH=$QTDIR

alias cd="z"
alias cat="bat"
alias force-upgrade="sudo pacman -Syu --overwrite '*'"
alias yay-clean="yay -Scc"


function rgdelta() {
    rg --json -C 2 "$1" | delta
}
