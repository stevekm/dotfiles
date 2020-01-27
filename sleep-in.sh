#!/bin/bash
# https://apple.stackexchange.com/questions/158853/schedule-a-mac-to-sleep-just-one-time
# Schedule sleep in X minutes, use like: sleep-in 60
function sleep-in() {
  local minutes=$1
  local datetime=`date -v+${minutes}M +"%m/%d/%y %H:%M:%S"`
  sudo pmset schedule sleep "$datetime"
}
