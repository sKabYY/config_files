#!/usr/bin/env bash

set -x  # echo on

if [ -d "~/.emacs.d/evil" ]; then
  git clone git://gitorious.org/evil/evil.git ~/.emacs.d/evil
fi

rm -f ~/.emacs
ln -s ~/config_files/emacs.el ~/.emacs

echo 'Done!'
