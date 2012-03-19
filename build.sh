#!/bin/sh
for i in `find $HOME/.dotfiles ! -name ".git*" ! -name "build.sh" ! -name "README.markdown" -depth 1`; do ln -s $i $HOME/.; done
