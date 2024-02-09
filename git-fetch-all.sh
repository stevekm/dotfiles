#!/bin/bash
set -euo pipefail

git_fetch_all () {
    local repodir="$1"
    local b=""
    local allbranches="$(git branch -r)"

    for b in `git branch -r | grep -v -- '->'`; do
      if [ "$b"!="" ]; then
      echo ">>> tracking branch $b ($repodir)"
      set +e
      set -x
      git branch --track ${b##origin/} $b
      set +x
      set -e
      fi
    done

    if [ "${allbranches}" != "" ]; then
      echo "allbranches: |${allbranches}|"
      set -x
      git fetch --all
      git pull --all
      set +x
    fi
}

for i in $(find . -mindepth 1 -maxdepth 1 -type d); do
(
  cd $i
  if [ -e .git ]; then echo ">>> $i"; git_fetch_all "$i" ; fi
)
done
