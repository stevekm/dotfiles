Dotfiles
========
This is a repository containing my custom dotfiles and device-independent commands that I include in them. 
Right now, I am primarily interested in .bashrc file and .bash_profile. In future updates, others may be added. 

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
Or this if I tried the first one and it didn't work
```bash
git remote set-url origin https://stevekm@github.com/stevekm/dotfiles.git
```
Of course these only work for me, insert your username instead and maybe they will work for you too. 

------------

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
