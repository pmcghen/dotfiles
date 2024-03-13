#!/bin/sh

# Help from: https://www.atlassian.com/git/tutorials/dotfiles and https://github.com/ngshiheng/dotfiles/blob/main/run_once_install-packages.sh

# exist checks if a command exists in the shell
exist() {
	command -v "$1" >/dev/null 2>&1
}

log() {
	printf "\033[36;2m [%s] - \033[96;1m%s\n" "$(date)" "$1"
}

log "Installing zsh syntax highlighting..."
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null

log "Installing oh-my-zsh..."
# https://ohmyz.sh/#install
if ! [ -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

log "Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

log "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz

log "Installing thefuck..."
pip3 install thefuck --user

log "Installing FiraCode Nerd Font..."
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
sudo unzip FiraCode.zip -d ~/.fonts
rm FiraCode.zip

log "Getting dotfiles from git..."
git clone --bare https://github.com/pmcghen/dotfiles $HOME/.custom

config() {
	/usr/bin/git --git-dir=$HOME/.custom/ --work-tree=$HOME $@
}

rm .zshrc

mkdir -p .config-backup
config checkout

if [ $? = 0 ]; then
	log "Checked out config..."
else
	log "Backing up existing dotfiles..."
	config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs =I {} mv {} .config-backup/{}
fi

config checkout
config config status.showUntrackedFiles no

echo "export PATH=\"$PATH:/opt/nvim-linux64/bin\"" >>~/.zshrc

printf "\033[92;34m Done! Please restart your terminal.\n\n"
