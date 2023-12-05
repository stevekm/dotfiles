# Ubuntu Notes

some packages commonly installed in Ubuntu

```bash
# sudo apt install

# utilities
git
htop
btop
make
screen
bzip2
curl
tree
awscli
openjdk-18-jre


# dev
r-base
python
openjdk-18-jdk
```

install Go (Golang)

- download the tarball from here [https://go.dev/dl/](https://go.dev/dl/)

```bash
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
sudo nano ~/.profile
# add this line to your .profile:
# export PATH=$PATH:/usr/local/go/bin
```

```bash
# system tools (some of these might not be needed or might be deprecated)
hddtemp
inxi
jq
ifconfig
lm-sensors
net-tools
psensor
openssh-server
sensors-applet
sublime-text
sysstat
stress-ng
flatpak
apt-transport-https
flatpak # https://flatpak.org/setup/Ubuntu

nvme-cli # to get stats on NVMe ssd

smartmontools # to get SMART data on drives

deluged deluge-web deluge-console deluge # torrents

samba cifs-utils smbclient # SMB shares

# for docker and singularity container
apt-transport-https ca-certificates curl software-properties-common
docker-ce docker-compose-plugin
build-essential libseccomp-dev  libglib2.0-dev pkg-config squashfs-tools cryptsetup runc

```

# Packages

upgrade packages commands [source](https://askubuntu.com/questions/196768/how-to-install-updates-via-command-line#196777)

```bash
sudo apt update        # Fetches the list of available updates
sudo apt upgrade       # Installs some updates; does not remove packages
sudo apt full-upgrade  # Installs updates; may also remove some packages, if needed
sudo apt autoremove    # Removes any old packages that are no longer needed
```

# conda

install conda

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

# Containers

Docker, Singularity


## Docker Installation

[source](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

(copy / pasted verbatim from that link)

First, update your existing list of packages:

```bash
sudo apt update
```
Next, install a few prerequisite packages which let apt use packages over HTTPS:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```


Then add the GPG key for the official Docker repository to your system:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the Docker repository to APT sources:

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:

```bash
apt-cache policy docker-ce
```

Finally, install Docker:

```bash
sudo apt install docker-ce
```

Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running:

```bash
sudo systemctl status docker
```

If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:

```bash
sudo usermod -aG docker ${USER}
```

To apply the new group membership, log out of the server and back in, or type the following:

```bash
su - ${USER}
```

Confirm that your user is now added to the docker group by typing:

```bash
groups
```

If you need to add a user to the docker group that you’re not logged in as, declare that username explicitly using:

```bash
sudo usermod -aG docker username
```

test that it works;

```bash
docker run --rm -ti ubuntu:latest
```

make sure Docker starts at boot [source](https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot-with-systemd)

```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

## Singularity / Apptainer

(Singularity is now called Apptainer and there is an official Apptainer version and a community legacy Singularity version)

install Singularity

- https://docs.sylabs.io/guides/3.11/admin-guide/installation.html
- https://github.com/sylabs/singularity/releases
- see also; https://sylabs.io/2023/03/installing-singularityce-on-macos-with-apple-silicon-using-utm/

first install Golang; https://go.dev/doc/install download the Go source code tarball from here
then extract and install it with

```bash
tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
```

add the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):

```bash
export PATH=$PATH:/usr/local/go/bin
```

Verify that it works

```bash
go version
```

On Ubuntu or Debian install the following dependencies:
```bash
# Ensure repositories are up-to-date
sudo apt-get update

# Install debian packages for dependencies
sudo apt-get install -y \
    build-essential \
    libseccomp-dev \
    libglib2.0-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    runc
```

Download source code for Singularity

NOTE: there may be newer versions available at different locations!!

```bash
export VERSION=3.11.0 && # adjust this as necessary \
     wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz && \
     tar -xzf singularity-ce-${VERSION}.tar.gz && \
     cd singularity-ce-${VERSION}
```

Compile Singularity

```bash
./mconfig --without-conmon && make -C ./builddir && sudo make -C ./builddir install
```

Test that it works

```bash
singularity exec library://alpine cat /etc/alpine-release
singularity pull container.sif docker://alpine:latest
```

NOTE: OLD docs for Singularity installation;
- https://singularity-tutorial.github.io/01-installation/
- https://apptainer.org/admin-docs/master/installation.html
- https://github.com/apptainer/singularity/releases



# Storage and Drives

to get stats on NVMe ssd
```bash
# nvme-cli
sudo nvme smart-log /dev/nvme0
```

# Boot Settings

show all messages during boot;

- edit this file `/etc/default/grub`
  - make sure you make a backup copy of this file before editing it!

- comment out this line; `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`
  - replace it with this line `GRUB_CMDLINE_LINUX_DEFAULT=""`

- add this line; `GRUB_CMDLINE_LINUX=""`

- need to update GRUB after editing the file or the changes will not take effect
  - this safely migrates the changes to the file `/boot/grub/grub.cfg` which you should never touch

```bash
sudo update-grub
```

For full documentation of the options in this file, see:
`info -f grub -n 'Simple configuration'`
source: https://askubuntu.com/questions/248/how-can-i-show-or-hide-boot-messages-when-ubuntu-starts



# Nividia GPU Drivers

Installation

There are multiple ways to install Nvidia drivers, such as this one;

- https://help.ubuntu.com/community/NvidiaDriversInstallation

however ^^^ this one never seems to work right so I usually do not use it


## Find recommended drivers

Use this command to find the drivers you should download

```bash
ubuntu-drivers device
```

install one of the listed drivers

```bash
# chose 545 here because it was listed from the above step
sudo apt install nvidia-driver-545
```

if you broke your drivers after doing some `apt upgrade` then try this to remove your busted drivers and repeat the above steps to install recommended ones again

- [source](https://askubuntu.com/questions/1191638/graphics-and-resolution-problems-nvidia-in-ubuntu-18-04-after-update#1203876)

- if you reboot at this step, the computer will use Nouveau driver

```bash
sudo apt purge nvidia*
```

## CUDA installation

installing CUDA can be very easy or nighmarishly frustrating

there are several install methods, I cannot remember which one works...

resources;
- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/
- https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_network
- more issues here; https://askubuntu.com/questions/1436506/how-to-resolve-unmet-dependencies-error-when-upgrading-depends-nvidia-kernel-c

first install the nvidia driver;

```bash
# pick the driver from the above step
sudo apt install nvidia-driver-515
```

then do the local CUDA install method

NOTE: warning, I dont know if this is outdated

```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
```

### NVLink

testing that NVLink works

resources
- https://docs.nvidia.com/deeplearning/nccl/install-guide/index.html
- https://github.com/NVIDIA/nccl-tests
- https://stackoverflow.com/questions/43022843/nvidia-nvml-driver-library-version-mismatch

```bash
# make sure you have these installed
sudo apt install libnccl2 libnccl-dev

# from that nccl-tests repo run this to see if NVLink is working
nccl-tests/build$ ./reduce_scatter_perf -g 2 -n 20000
```





# Swap file configuration

resources;
- https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-22-04
- https://askubuntu.com/questions/927854/how-do-i-increase-the-size-of-swapfile-without-removing-it-in-the-terminal
- https://help.ubuntu.com/community/SwapFaq

check existing swap and memory usages

```bash
sudo swapon --show
free -h
df -h

# create 100GB swap file
sudo fallocate -l 100G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

can be done with multiple files for swap

add to /etc/fstab to make permanent
entry should look like this

```
/swapfile none swap sw 0 0
```





# Format and mount drive
# https://phoenixnap.com/kb/linux-format-disk
# https://kwilson.io/blog/format-a-linux-disk-as-ext4-from-the-command-line/
# https://askubuntu.com/questions/517354/terminal-method-of-formatting-storage-drive
# https://help.ubuntu.com/community/Fstab
# find drive UUID
# $ lsblk -f
# also
# $ ls -l /dev/disk/by-uuid/
# or
# sudo fdisk -l
#
# format drive
# $ sudo mkfs ext4 -L P4600 /dev/nvme2n1p1 # wait this one did not work it make an ext2 volume instead
# $ sudo mkfs.ext4 -L P4600 /dev/nvme2n1p1
# get UUID again
# $ lsblk -f
# mount the drive
# $ sudo mount UUID=ebbb4fad-6329-4914-b800-e3ed22b36574 /mnt/P4600
# add to /etc/fstab
# UUID=ebbb4fad-6329-4914-b800-e3ed22b36574 /mnt/P4600               ext4    defaults 0       0
# mount all volumes
# $ sudo mount -a
#
# $ sudo mkfs.ext4 -L MX500 /dev/sda2
# $ lsblk -f
# $ sudo mkdir /mnt/MX500
# $ sudo mount UUID=bed1b9e9-2f5e-4289-bcf0-44566fa9b626 /mnt/MX500
# $ sudo mkdir /mnt/MX500/models
# $ sudo chown steve /mnt/MX500/models
# $ sudo chgrp steve /mnt/MX500/models
#
#
# if brand new disk does not have any partitions yet;
# https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux
# identify new disk;
# sudo parted -l
# or
# lsblk

# apply partition with
# sudo parted /dev/sdb mklabel gpt
# sudo parted -a opt /dev/sdb mkpart primary ext4 0% 100%
# sudo mkfs.ext4 -L S870 /dev/sdb1

# sdb
# └─sdb1      ext4     1.0   S870  b6c82947-41a3-4cf1-baa1-8fc545463266

# sudo mkdir /mnt/S870
# sudo chown steve /mnt/S870/
# sudo mount UUID=b6c82947-41a3-4cf1-baa1-8fc545463266 /mnt/S870
# add to /etc/fstab
# UUID=b6c82947-41a3-4cf1-baa1-8fc545463266 /mnt/S870               ext4    defaults 0       0



# Network debug
# get your external IP address
# $ curl http://checkip.amazonaws.com
# $ curl ifconfig.me
# get IP address for a URL
# $ nslookup google.com
# $ dig google.com
# check that a remote server can be reached
# $ ping 1.1.1.1
# check what service is running on a specific local port
# $ sudo lsof -i :53

# mount SMB share
$ sudo mount -t cifs -o guest,username=guest,vers=3.0 //192.168.1.200/Media /media/share/Media
# put this in /etc/fstab
//192.168.1.200/Media /media/share/Media cifs    guest,username=guest,ro     0       0
# check the SMB access with this
smbclient -L 192.168.1.200 -U guest
# if you need to allow it through the firewall
sudo ufw allow Samba
