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

On some systems I need to use this instead

```bash
git clone https://stevekm@github.com/stevekm/dotfiles.git
```
Or this 
```bash
git remote set-url origin https://stevekm@github.com/stevekm/dotfiles.git
```
Of course these only work for me, insert your username instead and maybe they will work for you too. 

Then run this
```bash
cd ~
ln -s ~/dotfiles/bashrc_steve_extras ~/.bashrc_steve_extras
echo "source ~/.bashrc_steve_extras" >> ~/.bashrc
```

On machines that do not come with a .bashrc but have a .bash_profile, also run this
```bash
echo "source ~/.bashrc" >> ~/.bash_profile
```
