#!/bin/bash

# script to set Nvidia GPU power limit to 240W

# set the script to run at boot
# https://askubuntu.com/questions/290099/how-to-run-a-script-during-boot-as-root/290107#290107
# put this in crontab on boot;
# @reboot sh /home/(username)/nvidia-pl.sh 

# you need to add the following lines to the sudoers file to allow the nvidia-smi command to be run as sudo without the need for a password. 
# https://www.howtogeek.com/842739/how-to-add-a-user-to-the-sudoers-file-in-linux/ 
# sudo visudo
# (your username) ALL=(ALL) NOPASSWD: /usr/bin/nvidia-persistenced
# (your username) ALL=(ALL) NOPASSWD: /usr/bin/nvidia-smi


#Enable persistence mode
sudo nvidia-smi -pm ENABLED
#Set power limit to 240Watts
sudo nvidia-smi -pl 200

# check current power settings with
# sudo nvidia-smi -q -d POWER
