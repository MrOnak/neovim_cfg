## install FZF and configure
* `sudo apt install fd-find`
* `ln -s /usr/bin/fdfind /usr/bin/fd`
* `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
* `~/.fzf/install`

* move .fzf files to .config
* `cp -r ~/.fzf/shell ~/.config/fzf/shell`
* `cp -r ~/.fzf/bin ~/.config/fzf/bin`
* `mv ~/.fzf.bash ~/.config/fzf/.fzf.bash`
* `rm -rf ~/.fzf`

* change the keybind from Ctrl-t to Ctrl-f in ~/.config/fzf/shell/key-bindings.bash

* adapt the ~/.bashrc
```
# fuzzy finder
[ -f ~/.config/fzf/.fzf.bash ] && source ~/.config/fzf/.fzf.bash
export FZF_DEFAULT_OPTS="--height 40% --border=sharp --no-unicode --layout=reverse-list --preview='head -10 {}' --preview-window='right,40%,border-left,wrap'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
```

# SSH
* `touch ~/.ssh/config`

```
Host github_MrOnak
  HostName github.com
  User git
  IdentityFile ~/.ssh/mrOnak_at_github_2022
  IdentitiesOnly yes
```

* adapt .bashrc with keybind to register SSH password
```
_ssh_add_key() {
  echo "register SSH key password"
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/mrOnak_at_github_2022
}

bind -x '"\C-t": _ssh_add_key'
```

# prerequisites for neovim 
* `sudo apt install git unzip wget curl tar`
* `sudo apt install ripgrep`
* `sudo apt install python3 python3-pip`
* `pip3 install --upgrade pynvim`
* `sudo apt install nodejs npm`
* `sudo npm cache clean -f`
* `sudo npm install -g n`
* `sudo n stable`
* `sudo npm install -g neovim`

# install nerd font
* download the "hack" font .zip file from nerdfonts.com:
* `wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip`
* `unzip Hack.zip`
* `mkdir ~/.fonts`
* `mv *.ttf ~/.fonts`
* `fc-cache -fv`
* close all instances of the terminal and set custom font

# neovim itself
* `git clone https://github.com/MrOnak/neovim_cfg.git ~/.config/nvim`
* `cd ~/.config/nvim`
* `git checkout nerdfont`
* `cd ~`
* `sudo add-apt-repository ppa:neovim-ppa/stable`
* `sudo apt update`
* `sudo apt install neovim`


