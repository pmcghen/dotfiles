# dotfiles

Install and configure my development tools.

## Prerequisites

It's best to have `curl` installed before running these scripts.

## Install

### Step 1

The first script updates `apt` and installs the necessary packages.
We'll be installing:

- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)
- [tmux](https://github.com/tmux/tmux/wiki)
- git
- zsh
- neofetch
- python3-dev (for [thefuck](https://github.com/nvbn/thefuck))
- python3-pip (for thefuck)
- python3-setuptools (for thefuck)

```bash
curl -Lks https://raw.githubusercontent.com/pmcghen/dotfiles/main/install-apt.sh | /bin/bash
```

After running this script, you'll need to log out or restart your machine.

### Step 2

After logging in again, we'll move on to installing third party tools from
outside of `apt`. We'll be installing:

- [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [oh my zsh](https://ohmyz.sh/#install)
- [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [thefuck](https://github.com/nvbn/thefuck)
- [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)
- [tpm](https://github.com/tmux-plugins/tpm)

```bash
curl -Lks https://raw.githubusercontent.com/pmcghen/dotfiles/main/install-workflow-tools.sh | /bin/bash
```

### Step 3

After running the second script, close your terminal. When starting a new
terminal session, you'll want to change your terminal's preferences so it
uses FiraCode. Next, you'll want to start `tmux` and execute the following
command:

```bash
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

You may also need to run `prefix` + `I` (capital i, as in Install) from a tmux
session.
