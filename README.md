# My Dotfiles
Dot files for ~

- [x] Editor: Neovim
- [x] Terminals: Kitty, WezTerm
- [x] Window manager: i3wm, polybar, rofi
 
## Usage

Pre-requisites

```sh
# Copy private ssh keys and start ssh agent
# Host machine
> scp -i ~/.ssh/my_remote ~/.ssh/xyz_rsa me@192.168.1.199:~/.ssh

# Remote machine
> eval "$(ssh-agent -s)"
> ssh-add ~/.ssh/xyz_rsa

# Update shell to zsh
> sudo usermod -s /usr/bin/zsh myusername
```

Run the following on a new machine.

```sh
> cd
> git init
> git remote add origin git@github.com:codito/dotfiles.git
> git pull origin master
> git submodule update --init
```

Install `starship` and `autojump-rs` for the system.

Setup tmux plugins.

```sh
> git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
> tmux source ~/.tmux.conf

# Press Prefix+I to install all plugins.
```
