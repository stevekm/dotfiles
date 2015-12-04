Dotfiles
========
This is a repository containing my custom dotfiles and device-independent commands that I include in them. These commands are saved in a separate dotfile, then symlinked to ~ and sourced by the original dotfile by appending the following line:

```
source ~/.my_custom_dotfile
```

Right now, I am primarily interested in my .bashrc file and .bash_profile, so the script will only work with those two. In future updates, others may be added. 

Installation
------------

You can install this by running the following commands

``` bash
git clone https://github.com/stevekm/dotfiles.git ~/dotfiles
```
