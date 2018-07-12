#!/bin/bash

[ ! -d vim ] && git clone https://github.com/vim/vim.git


if [ -d vim ]; then
(
cd vim/src
sed -i 's|#prefix = $(HOME)|prefix = $(HOME)|' vim/src/Makefile
make install
)
fi


# http://www.vim.org/scripts/script.php?script_id=2666
# NSTALLATION
# This script is packaged as a vimball. If you have the "gunzip" decompressor
# in your PATH, simply edit the *.vmb.gz package in Vim; otherwise, decompress
# the archive first, e.g. using WinZip. Inside Vim, install by sourcing the
# vimball or via the :UseVimball command.
#     vim mark*.vmb.gz
#     :so %
# To uninstall, use the :RmVimball command.


# add this to bashrc
# [ -d "${HOME}/bin" ] && export PATH=$PATH:${HOME}/bin
# [ -d "${HOME}/share ] && export PATH=$PATH:${HOME}/share
