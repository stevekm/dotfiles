#!/bin/bash
# USAGE: now <your message here>
# source this from your bashrc! don't call the script directly

# (BASIC USAGE) this script sets up a custom function that creates a log file in your Home directory
# for storing quick notes about what you are doing at the time
# log file here: $HOME/.now.tsv

# (ADVANCED USAGE) this script will automatically detect if your pwd is 
# in your 'projects' dir (i.e. you are working on a project)
# and also add the note to a separate log file for the project you are working in 
# logfile here: $ProjDir_logPath/.now.projectlog.tsv

# log files are in .tsv format, with timestamped and pwd-stamped entries

# # FUTURE DEVELOPMENTS FOR THIS SCRIPT
# # issue: shell interpretted special characters break the script a bit; solution: Don't use ', ", ;, etc. ....
# # # don't use anything listed on this page in your note: http://tldp.org/LDP/abs/html/special-chars.html
# # allow for user-set list of project dirs
# # make script/function exit if the logdir path is invalid - DONE
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
  echo -e "$MyDate\t$Args\t$PWD" >> $HOME/now.log/.now.tsv
  echo -e "Logged in $HOME/now.log/.now.tsv"

  #
  # #
  # # # 
  # advanced logging; also add the entry to the project log
  # if the current working directory is a project directory
  
  # # get the username
  # USER_NAME=$(whoami)  # depricated 
  
  # # set the project dir(s) to watch
  # # # future version; allow for a list of proj dirs here
  My_Dir=$HOME/projects


  # check if My Dir is a part of pwd file path
  if [[ "$PWD" == *"$My_Dir"* ]]; then
    # set up the logfile path

    # root project dir; strip anything after the path
    # # this will allow for items in front of the path, though
    ProjRootDir="${PWD%$My_Dir*}$My_Dir"

    # dir path of the pwd within the project dir; strip anything before the path
    ProjDir_pwd="${PWD#*$My_Dir/}"

    # basename of the current proj dir; strip everything after the dirname
    ProjDir_basename="${ProjDir_pwd%%/*}"

    # path for the log file; within the base proj dir
    ProjDir_logPath="$ProjRootDir/$ProjDir_basename"

    # the actual log file 
    LogFile="$ProjDir_logPath/.now.projectlog.tsv"

    # make sure the directory exists
    if [[ -d "$ProjDir_logPath" ]]; then
      :
    else
      echo "Warning: Project log dir does not exist;"
      echo "$ProjDir_logPath"
      echo "check the now log script"
      exit 
    fi
  
    # write the project log entry
    echo -e "$MyDate\t$Args\t$PWD" >> $LogFile
    echo -e "Logged in $LogFile"

  fi
    }
