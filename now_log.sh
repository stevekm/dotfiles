#!/bin/bash
# source this from your bashrc!

now() {
  #
  # #
  # # # 
  # basic now logging
  
  # # set the date
  MyDate=$(date "+%Y-%m-%d %H:%M:%S")
  
  # # the arguments passed to the script
  Args="$@"
  
  # # write the entry to the now log file
  echo -e "$MyDate\t$Args\t$PWD" >> $HOME/.now.tsv

  #
  # #
  # # # 
  # advanced logging; also add the entry to the project log
  # if the current working directory is a project directory
  
  # # get the username
  USER_NAME=$(whoami)
  
  # # set the project dir(s) to watch
  # # # future version; allow for a list of proj dirs here
  My_Dir=/ifs/home/$USER_NAME/projects


  # check if My Dir is a part of pwd file path
  if [[ "$PWD" == *"$My_Dir"* ]]; then
    # set up the logfile path

    # root project dir; strip anything after the path
    # # this will allow for items in front of the path, though
    ProjRoot="${PWD%$My_Dir*}$My_Dir"

    # dir path of the pwd; strip anything before the path
    ProjDir="${PWD#*$My_Dir/}"

    # basename of the current proj dir; strip everything after the dirname
    ProjDir_base="${ProjDir%/*}"

    # path for the log file; within the base proj dir
    ProjDir_logPath="$ProjRoot/$ProjDir_base"

    # the actual log file 
    LogFile="$ProjDir_logPath/.now.projectlog.tsv"

    # make sure the directory exists
    if [[ -d "$ProjDir_logPath" ]]; then
      :
    else
      echo "Warning: Project log dir does not exist;"
      echo "$ProjDir_logPath"
      echo "check the now log script"
    fi
  
    # write the project log entry
    echo -e "$MyDate\t$Args\t$PWD\t$LogFile" >> $LogFile

  fi
    }
