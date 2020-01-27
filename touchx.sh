#!/bin/bash
# touch a file and make it executable, useful for creating new scripts quickly with a single command
touchx () { touch "$1"; chmod +x "$1"; }
