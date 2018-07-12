Dotfiles
========
This is a repository containing my custom dotfiles and device-independent commands that I include in them.
Right now, I am primarily interested in .bashrc file and .bash_profile. In future updates, others may be added.

Installation
------------

Clone this repo

``` bash
git clone https://github.com/stevekm/dotfiles.git
```


```bash
cd ~
ln -s ~/dotfiles/bashrc_steve_extras ~/.bashrc_steve_extras
echo "source ~/.bashrc_steve_extras" >> ~/.bashrc
```

On machines that do not come with a .bashrc but have a .bash_profile, also run this
```bash
echo "source ~/.bashrc" >> ~/.bash_profile
```

Will probably have to exit the shell and restart for changes to take effect completely.

-------

If setting this on a local machine (not a server) then also run this to switch to the correct color scheme

```bash
sed -i '/92m/ s/92m/31m/' ~/dotfiles/bashrc_steve_extras

# on OS X use this
sed -i '' -e '/92m/ s/92m/31m/' ~/dotfiles/bashrc_steve_extras
```

Keep in mind this change will get overwritten with any git pull's on this repo. Also be sure there are no other added lines with '92m' or they will get overwritten as well.

Should look like this:

![image](https://cloud.githubusercontent.com/assets/10505524/21250576/5f4f884a-c314-11e6-90c2-9156e6c89b7d.png)
