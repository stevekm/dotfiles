# macOS notes

## Homebrew

- [https://brew.sh/](https://brew.sh/)

install homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

new packages to install, and old outdated ones to replace

```bash
# package to install with brew install
wget
htop 
btop
lftp
tree
rsync
btop
pigz
smartmontools
nano
make
micro
```

- use the included `nanorc` file to get Brew `nano` syntax highlighting to work, copy the file to `~/.nanorc`

- see the docs on `micro` settings here https://github.com/zyedidia/micro/blob/master/runtime/help/options.md
  - the file `config_micro_settings.json` should be copied to `~/.config/micro/settings.json`

## Misc

check SMART data on the internal SSD

```bash
sudo smartctl --all /dev/disk0
```

list all SMB share points 
also use this to define and configure new and existing ones
```bash
sharing -l
```
