#!/bin/bash

#  use git to diff two files or dirs at the per-character level

gdiff () {
    git diff --no-index --word-diff=color --word-diff-regex=. "${1}" "${2}"
}
