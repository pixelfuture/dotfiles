# dotfiles

Back up of dotfiles.


## Install Homebrew
First be sure you have [homebrew] installed.

```
xcode-select --install
cd /usr/local
mkdir homebrew 
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
```

[homebrew]: https://docs.brew.sh/Installation

## Install Neovim
Use brew to install neovim
```
brew install neovim
```

### Clone this repo
```
git clone git@github.com:pixelfuture/dotfiles.git
```

### Create a symbolic link to nvim config
```
 ln -s ~/dotfiles/nvim ~/.config/nvim
```

## Files
| File Name       | Description                             |
|-----------------|-----------------------------------------|
| .zshrc          | zsh config file                         |
| .config/nvim    | neovim config file                      |
| vim-plugins.txt | list of currently installed vim plugins |
