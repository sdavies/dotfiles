Shanes Dotfiles
===============

This is repsoitory is intended for storing my common dotfiles.

Installation
------------

Follow instructions for installing rcm on their [homepage at](https://github.com/thoughtbot/rcm)

    git clone https://github.com/sdavies/dotfiles.git ~/myplacefordotfiles
    echo "DOTFILES_DIRS=~/myplacefordotfiles" > ~/.rcrc
    rcup -v
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

Optionally setup rbenv
----------------------

    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    mkdir -p ~/.rbenv/plugins
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
    git clone https://github.com/carsomyr/rbenv-bundler.git ~/.rbenv/plugins/bundler
    rbenv install 2.2.3
    rbenv global 2.2.3
    rbenv rehash
