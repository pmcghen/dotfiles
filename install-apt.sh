#!/usr/bin/bash

log() {
	printf "\033[36;2m [%s] - \033[96;1m%s\033[0;39m\n" "$(date)" "$1"
}

log "Hi, $USER. Let's get your new machine set up."
log "Updating apt..."
sudo apt update

log "Installing system packages from apt..."
sudo apt install fzf bat tmux curl git zsh neofetch python3-dev python3-pip python3-setuptools unzip

log "Setting zsh as your default shell..."
chsh -s $(which zsh)

log "Setting symlink for bat..."
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

log "Done! Please log out to apply updates."
