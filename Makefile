SHELL:=/bin/bash
HOMEDIR:=$(shell echo $$HOME)
UNAME:=$(shell uname)
TIMESTAMP:=$(shell date '+%Y-%m-%d-%H-%M-%S')
# ~~~~~ Setup Conda ~~~~~ #
# this sets the system PATH to ensure we are using in included 'conda' installation for all software
PRE:=
CONDA_DIR:=$(PRE)conda
PATH:=$(CONDA_DIR)/bin:$(PATH)
unexport PYTHONPATH
unexport PYTHONHOME

# install versions of conda for Mac or Linux
ifeq ($(UNAME), Darwin)
CONDASH:=Miniconda3-4.5.4-MacOSX-x86_64.sh
endif

ifeq ($(UNAME), Linux)
CONDASH:=Miniconda3-4.5.4-Linux-x86_64.sh
endif

CONDAURL:=https://repo.continuum.io/miniconda/$(CONDASH)

# install conda
conda:
	@echo ">>> Setting up conda..."
	@wget "$(CONDAURL)" && \
	bash "$(CONDASH)" -b -p "$(CONDA_DIR)" && \
	rm -f "$(CONDASH)"

# install the conda and python packages required
# NOTE: **MUST** install ncurses from conda-forge for RabbitMQ to work!!
conda-install:
	conda install -y conda-forge::ncurses && \
	conda install -y -c conda-forge tmux



#
# all: link-extras add-extras-to-bashrc add-inputrc
#
# # create a symlink in the home dir to the extras file in this repo
# EXTRASPATH:=$(shell python -c 'import os; print(os.path.realpath("bashrc_extras"))')
# EXTRASLINK:=$(HOMEDIR)/.bashrc_extras
# link-extras: $(EXTRASLINK)
# $(EXTRASLINK):
# 	@echo ">>> Creating link to 'bashrc_extras' in home dir..."
# 	@ln -s "$(EXTRASPATH)" "$(EXTRASLINK)"
#
# # create the user .bashrc if it does not exist
# BASHRC:=$(HOMEDIR)/.bashrc
# $(BASHRC):
# 	@echo ">>> File $(BASHRC) does not exist, creating it..."
# 	@touch "$(BASHRC)"
#
# # add an entry in user .bashrc to source the extras file
# add-extras-to-bashrc: $(BASHRC)
# 	@if ! $$(grep -q '.bashrc_extras' $(BASHRC)); then \
# 	echo ">>> Adding 'extras' entry to .bashrc..." ; \
# 	echo "source '$(EXTRASLINK)'" >> "$(BASHRC)" ; \
# 	fi
#
# # press up/down after typing a command on console to search history of just that command
# INPUTRC:=$(HOMEDIR)/.inputrc
# add-inputrc: $(INPUTRC)
# $(INPUTRC):
# 	@echo ">>> File $(INPUTRC) does not exist, adding it..."
# 	@cp inputrc "$(INPUTRC)"
#
# # designate system as my local desktop
# LOCALFILE=.local
# local: $(LOCALFILE)
#
# $(LOCALFILE):
# 	touch $(LOCALFILE)
# 	if [ -f "$(REMOTEFILE)" ]; then rm -f "$(REMOTEFILE)"; fi
#
# # designate system as a remote server
# REMOTEFILE=.remote
# remote: $(REMOTEFILE)
# $(REMOTEFILE):
# 	touch $(REMOTEFILE)
# 	if [ -f "$(LOCALFILE)" ]; then rm -f "$(LOCALFILE)"; fi

# set up git username and email
NAME:=
EMAIL:=
# stevekm@users.noreply.github.com
git: git-setup-username git-setup-email
git-setup-username:
	@if [ -z "$$(git config --get user.name)" ]; then \
	if [ ! -z "$(NAME)" ]; then \
	echo ">>> Git username not set, setting it to $(NAME)"; \
	git config --global user.name "$(NAME)"; \
	else echo ">>> Git username not set, no NAME provided (e.g. make NAME=yourname)"; exit 1 ; fi ; \
	fi
git-setup-email:
	@if [ -z "$$(git config --get user.email)" ]; then \
	if [ ! -z "$(EMAIL)" ]; then \
	echo ">>> Git email not set, setting it to $(EMAIL)"; \
	git config --global user.email "$(EMAIL)"; \
	else echo ">>> Git username not set, no EMAIL provided (e.g. make EMAIL=yourname)"; exit 1 ; fi ; \
	fi

# set up 'now' logger
# https://github.com/stevekm/now-log.git
# git@github.com:stevekm/now-log.git
NOWDIR:=$(HOMEDIR)/now-log
NOWSCRIPT:=$(NOWDIR)/now-logger.sh
now: now-clone add-now-to-bashrc
now-clone: $(NOWDIR)
$(NOWDIR) $(NOWSCRIPT):
	git clone https://github.com/stevekm/now-log.git "$(NOWDIR)"
add-now-to-bashrc: $(NOWSCRIPT) $(BASHRC)
	@if ! $$(grep -q 'now-logger.sh' $(BASHRC)); then \
	echo ">>> Adding 'now' entry to .bashrc..." ; \
	echo "source '$(NOWSCRIPT)'" >> "$(BASHRC)" ; \
	fi
# clean:
# 	cd ~ && rm -f .inputrc .bashrc .bashrc_extras


# setup tmux config
tmux: $(HOMEDIR)/.tmux.conf
$(HOMEDIR)/.tmux.conf:
	[ -e "$(HOMEDIR)/.tmux.conf" ] && mv "$(HOMEDIR)/.tmux.conf" "$(HOMEDIR)/.tmux.backup_$(TIMESTAMP).conf" || :
	cp tmux.conf "$(HOMEDIR)/.tmux.conf"
	echo ">>> Please enter tmux and type '<prefix> + I' to fetch the plugins"
.PHONY:$(HOMEDIR)/.tmux.conf

# tmux plugin manager
tpm:
	[ ! -e ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || :
	tmux source ~/.tmux.conf
	echo ">>> Please enter tmux and type '<prefix> + I' to fetch the plugins"
.PHONY:tpm
