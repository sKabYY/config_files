#!/usr/bin/env bash

set -x  # echo on


# Bash #####################################################

rm -f ~/.bashrc
ln -s ~/config_files/bash/bashrc.sh ~/.bashrc

# Emacs ####################################################

if [ ! -d ~/.emacs.d ]; then
    mkdir ~/.emacs.d
fi

if [ ! -d ~/.emacs.d/evil ]; then
    git clone git://gitorious.org/evil/evil.git ~/.emacs.d/evil
fi
cd ~/.emacs.d/evil && make

rm -f ~/.emacs
ln -s ~/config_files/emacs/emacs.el ~/.emacs

############################################################

echo 'Done!'
