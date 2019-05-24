#!/bin/bash

CWD=$(pwd)

ln -s $CWD/vimrc $HOME/.vimrc
ln -s $CWD/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
ln -s $CWD/screenrc $HOME/.screenrc
ln -s $CWD/tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
ln -s $CWD/tpm $HOME/.tmux/plugins/tpm
ln -s $CWD/tmux-sensible $HOME/.tmux/plugins/tmux-sensible

touch ~/.bashrc

if ! grep -Fq "$CWD/bashrc" ~/.bashrc
then
    echo "" >> ~/.bashrc
    echo "# Added by jhood's config setup" >> ~/.bashrc
    echo "source $CWD/bashrc" >> ~/.bashrc
fi

