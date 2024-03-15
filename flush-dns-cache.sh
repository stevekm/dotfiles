#!/bin/bash

# https://www.freecodecamp.org/news/how-to-flush-dns-on-mac-macos-clear-dns-cache/

flush-dns-cache () {

sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

}
