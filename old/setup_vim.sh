#!/bin/bash

[ ! -d vim ] && git clone https://github.com/vim/vim.git


if [ -d vim ]; then
(
cd vim/src
sed -i 's|#prefix = $(HOME)|prefix = $(HOME)|' vim/src/Makefile
make install
)
fi

# add this to bashrc
# [ -d "${HOME}/bin" ] && export PATH=$PATH:${HOME}/bin
# [ -d "${HOME}/share ] && export PATH=$PATH:${HOME}/share
