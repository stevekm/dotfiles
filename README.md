# Dotfiles

This is a repository containing my custom dotfiles and custom commands and terminal settings.

# Setup

Clone this repo

``` bash
git clone https://github.com/stevekm/dotfiles.git
cd dotfiles
```

Enable or disable the sets of configs you want in `bashrc_extras` or `zshrc_extras`

- `zsh` is the default shell on a lot of newer Mac's, but many `bash` shell configs and aliases should still work

Add the following entry to your `~/.bashrc`:

```
source ~/dotfiles/bashrc_extras
```

- you may also need to create a file `~/.bash_profile` as well if its not present and may also need to `source` the `.bashrc` from there too
- if using `zsh` then source `~/dotfiles/zshrc_extras` from `~/.zshrc` instead

Restart your shell session for changes to take effect

Should look like this:

![image](https://cloud.githubusercontent.com/assets/10505524/21250576/5f4f884a-c314-11e6-90c2-9156e6c89b7d.png)

## Git

Set up your `git` username and email.

You might be able to use a command like this;

```
make git-setup-username git-setup-email NAME="My Name" EMAIL="github_username@users.noreply.github.com"
```

Or you can use commands like this;

```
git config --global user.name "My Name"
git config --global user.email "my_github_username@users.noreply.github.com"
```

## Conda

These days I typically install `conda` on most systems I will be using because it makes life easier.

The Miniconda latest docs and download is here; https://docs.conda.io/en/latest/miniconda.html

The Miniconda installer archive is here; https://repo.anaconda.com/miniconda/ 

Pick the version appropriate for your system. I usually download the `.sh` installer, and then install it with;

```
bash Miniconda3-latest-MacOSX-arm64.sh
```

I generally let the installer put Miniconda in the default location (`~/miniconda3`) and let it run the `conda init` step.

NOTE that running `conda init` will update your `.bashrc` and/or `.zshrc`, and possibly other shell config files, in order to make `conda` available by default in your shell. If you are going to use the `bashrc_extras` and `zshrc_extras` included here, you **MUST** update your `.bashrc`/`.zshrc` in order to `source` these files **after** the section included by `conda init`. Otherwise, both conda and the extras included here are likely to not work.
