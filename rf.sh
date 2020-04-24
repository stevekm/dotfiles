#!/bin/bash
# get the full absolute path to a file or dir
if [ "$(uname)" == "Darwin" ]; then
    # version for mac; install greadlink with Homebrew..; $ brew install coreutils
    rf () {
        local somedir="${1:-$PWD}"
        if [ ! -e "${somedir}" ]; then
            echo ">>> ERROR: Does not exist; ${somedir}"
        else
            greadlink -f "${somedir}"
        fi

    }
else
    rf () {
        local somedir="${1:-$PWD}"
        if [ ! -e "${somedir}" ]; then
            echo ">>> ERROR: Does not exist; ${somedir}"
        else
            readlink -f "${somedir}"
        fi

    }
fi
