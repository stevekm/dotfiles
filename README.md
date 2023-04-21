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

Also do not forget to copy the included `inputrc` file to enable better scrollback in your terminal;

```
cp inputrc ~/.inputrc
```

(also requires a terminal restart to take effect)

With this, you will be able to e.g. type `s` into your shell then press Up/Down Arrow keys to scroll through all commands in your shell history that start with "s" (such as that long ssh command you used last month which you cant remember now). 

## Git

**NOTE**: if you are on macOS and your `git` is not working, check out the section below about setting up Xcode first

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

## More

### Ubuntu 

Notes specific to setting up a personal Ubuntu instance are in `ubuntu.txt`

### macOS

Extra notes specific to setting up macOS

#### XCode
- https://developer.apple.com/xcode/resources/
 - also on the App Store https://apps.apple.com/us/app/xcode/id497799835?mt=12
- has a bunch of core tools and libraries that all dev tools require
- if you are not actually building macOS / iOS apps, then you do not need to download the entire giant XCode application, you **only** need the CLI Tools supplemental pack, which must be installed separately
- HOWEVER, Apple has recently started requiring you to log in with an Apple ID in order to access the CLI Tools installer (previously it was all publically downloadable), so you will likely have to either click through that homepage and login with an Apple ID, or log in to the Apple App Store to download
- after you have installed Xcode and/or the Xcode CLI Tools packs, you **must** accept License Agreement before any cli tool (such as `git`) will work
- accepting the agreement can sometimes be a PIA to do from the Terminal, so it might be easier to just go ahead and install the full Xcode application anyway if only to have an easier GUI window to click through to "Accept" the first time you launch Xcode
- sometimes if you upgrade macOS, you might need to do this whole process again before your cli tools (which worked fine before upgrading) will work again. Thanks, Apple.

#### [Homebrew](http://brew.sh/)
- Application manager for macOS
- see the homepage for the latest install instructions; https://brew.sh/
- some homebrew repos that you might need to add (or maybe not):
```bash
brew tap caskroom/cask
brew tap homebrew/science
```
- other useful Homebrew packages
```bash
# some GNU-like utilities that don't ship with macOS by default
brew install coreutils

# helpful tools
brew install wget 
brew install awscli
brew install btop
brew install tree
brew install watch

# quick & easy batch image conversion in the Terminal
brew install imagemagick

# manipulation of PDFs
brew install ghostscript

# if you ran into .7z archives or other weird archives you need to extract
brew install p7zip

# the versions of some basic tools included in macOS are ancient so you might want newer versions with extra better features
brew install rsync
brew install make  # GNU "make" has been installed as "gmake"
brew install bash 
```

#### Apps

##### [CyberDuck](https://cyberduck.io/)
- also on the App Store; https://cyberduck.io/appstore
- File manager for remote servers
- **Lets you edit code saved on remote servers in your local editor and syncs changes back to the remote server as you make them!**
- stop trying to dev your code on the remote server using `vim` and just open the remote code locally in your locally installed VS Code
 - also dont bother using the "sftp" extension for VS Code because Cyberduck can open **all** files in the local app of your choice
 - thank you CyberDuck you're a life saver! :)

##### [iTerm2](https://www.iterm2.com/downloads.html)
- Better terminal for OS X

##### [VS Code](https://code.visualstudio.com/download)
- Good code editor
- if you dont like Visual Studio Code then try Sublime Text

##### [Paintbrush](https://paintbrush.sourceforge.io/)
- MS Paint alternative for Mac. Quick & easy image editing. Or just use Preview.

##### [Scroll Reverser](https://pilotmoon.com/scrollreverser/)
- Reverse scrolling direction of touchpad and/or mouse on Mac, so you can have your mouse use normal scrolling and your touchpad use natural scrolling

##### BetterSnapTool
- allows you to snap windows properly to the sides of the screen in macOS (the way that Windows and Ubuntu have done for years.... thanks Apple...)
- https://www.folivora.ai/bettersnaptool/
- https://apps.apple.com/us/app/bettersnaptool/id417375580?mt=12

##### Docker
- run containers
- there is no longer any method to install Docker on macOS without jumping through hoops on Docker's website first, here: https://docs.docker.com/desktop/install/mac-install/


##### [XQuartz](https://www.xquartz.org/)
- Enables X11 graphical windows for terminal programs on remote servers, like IGV
```
brew cask install xquartz
```
- after installation, make sure you log into the server with the `-Y` argument: `ssh username@server.com -Y`

##### [MacTeX](http://www.tug.org/mactex/)
- LaTeX PDF typesetting program installation for OS X
