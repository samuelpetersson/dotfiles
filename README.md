# Dotfiles

## Setup

MacOS dependencies
```sh
brew install ag fzf
```

Install
```sh
git config --global include.path "$PWD/git/gitconfig"
ln -s $PWD/lf ~/.config/lf
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/wezterm ~/.config/wezterm
echo "\nsource $PWD/zsh/zshrc" >> ~/.zshrc
```