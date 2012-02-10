#!/bin/bash
# link dotfiles
_DOTFILES=$(pwd)
_GREP=$(which grep)
for i in .[a-zA-Z]*
do
	if (echo $i | $_GREP -qv "^.git"); then
		ln -s $_DOTFILES/$i ~/$i
	fi
done
ln -s $_DOTFILES/.gitconfig ~/.gitconfig
