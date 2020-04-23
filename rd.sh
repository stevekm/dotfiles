#!/bin/bash
# get the full absolute path to the dirname of file or dir
# this is useful when you need the full dir path to navigate to for CyberDuck
if [ "$(uname)" == "Darwin" ]; then
    # version for mac; install greadlink with Homebrew..; $ brew install coreutils
    rd () {
        local somedir="${1:-$PWD}"
        if [ ! -e "${somedir}" ]; then
            echo ">>> ERROR: Does not exist; ${somedir}"
        else
            dirname "$(greadlink -f "$somedir}")"
        fi

    }
else
    rd () {
        local somedir="${1:-$PWD}"
        if [ ! -e "${somedir}" ]; then
            echo ">>> ERROR: Does not exist; ${somedir}"
        else
            dirname "$(readlink -f "${somedir}")"
        fi

    }
fi
