# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

plugins=(
	colored-man-pages
  command-not-found
	git
	tmux
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

alias up="flatpak update; sudo apt update; sudo apt upgrade; sudo apt autoremove"
alias i="sudo apt install"
alias djmanage="python3 manage.py"
alias open="nautilus"
alias gs="git status"
alias note="echo >> ~/Documents/notes.md"

export PATH=/home/pat/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
eval $(thefuck --alias)

neofetch

alias config='/usr/bin/git --git-dir /home/pat/.custom/ --work-tree=/home/pat'
