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
export SUDO_EDITOR="nvim"
export EDITOR="nvim"

alias cd="z"
alias cat="bat"
alias force-upgrade="sudo pacman -Syu --overwrite '*'"
alias yay-clean="yay -Scc"


function rgdelta() {
    rg --json -C 2 "$1" | delta
}

WAYLAND_SRC="/mnt/wslg/runtime-dir/wayland-0*"
DEFAULT_LINK_TARGET="/run/user/1000"
FALLBACK_LINK_TARGET="/run/user/1001"

if [ -d "$DEFAULT_LINK_TARGET" ]; then
  ln -sf $WAYLAND_SRC "$DEFAULT_LINK_TARGET" 2>/dev/null
elif [ -d "$FALLBACK_LINK_TARGET" ]; then
  ln -sf $WAYLAND_SRC "$FALLBACK_LINK_TARGET" 2>/dev/null
else
  echo "Warning: Neither /run/user/1000 nor /run/user/1001 exists." >&2
fi
