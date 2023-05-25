#!/bin/zsh

brew bundle
brew bundle --force cleanup
brew update

asdf plugin add ruby
asdf install ruby 2.7.1
asdf global ruby 2.7.1

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 25.2.3
asdf global erlang 25.2.3
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

sed -i '' 's/plugins=.*/plugins=(git z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc

ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt

cp dotfiles/.vimrc $HOME/.vimrc
cp dotfiles/.zshrc $HOME/.zshrc
cp dotfiles/.iex.exs $HOME/.iex.exs
cp dotfiles/.git-authors $HOME/.git-authors
cp dotfiles/.gitconfig $HOME/.gitconfig

