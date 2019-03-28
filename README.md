# Dotfiles

This is a repository containing my custom dotfiles and device-independent commands that I include in them.
Right now, I am primarily interested in .bashrc file and .bash_profile. In future updates, others may be added.

# Installation

Clone this repo

``` bash
git clone https://github.com/stevekm/dotfiles.git
cd dotfiles
```

Enable or disable the sets of configs you want in `bashrc_extras`

Add the following entry to your `~/.bashrc`:

```
source ~/dotfiles/bashrc_extras
```

Restart your shell session for changes to take effect

Should look like this:

![image](https://cloud.githubusercontent.com/assets/10505524/21250576/5f4f884a-c314-11e6-90c2-9156e6c89b7d.png)

## Git

Set up your `git` username and email with the included Makefile:

```
make git-setup-username git-setup-email NAME="My Name" EMAIL="github_username@users.noreply.github.com"
```

## Conda

A conda installation can be created like this:

```
make conda conda-install PRE=/path/to/dir/
```

- will result in `conda` being installed at location `/path/to/dir/conda`; add this to your `PATH` in your `~/.bashrch`

```
export PATH="/path/to/dir/conda/bin:${PATH}"
```
