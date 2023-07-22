#!/bin/zsh

brew bundle
brew bundle --force cleanup
brew update

asdf plugin add ruby
asdf install ruby 3.2.2
asdf global ruby 3.2.2

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 26.0.2
asdf global erlang 26.0.2
asdf install elixir 1.15.0-otp-26
asdf global elixir 1.15.0-otp-26

sed -i '' 's/plugins=.*/plugins=(git z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc

# nvim setup
mkdir -p ~/.config/nvim
ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
nvim -es ./update-plugins.txt

# git setup
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

# dotfiles
cp dotfiles/.vimrc $HOME/.vimrc
cp dotfiles/.zshrc $HOME/.zshrc
cp dotfiles/.iex.exs $HOME/.iex.exs
cp dotfiles/.git-authors $HOME/.git-authors
cp dotfiles/.gitconfig $HOME/.gitconfig

