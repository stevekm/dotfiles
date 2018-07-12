HOMEDIR:=$(shell echo $$HOME)

all: link-extras add-extras-to-bashrc add-inputrc

# create a symlink in the home dir to the extras file in this repo
EXTRASPATH:=$(shell python -c 'import os; print(os.path.realpath("bashrc_extras"))')
EXTRASLINK:=$(HOMEDIR)/.bashrc_extras
link-extras: $(EXTRASLINK)
$(EXTRASLINK): 
	@echo ">>> Creating link to 'bashrc_extras' in home dir..."
	@ln -s "$(EXTRASPATH)" "$(EXTRASLINK)"

# create the user .bashrc if it does not exist
BASHRC:=$(HOMEDIR)/.bashrc
$(BASHRC):
	@echo ">>> File $(BASHRC) does not exist, creating it..."
	@touch "$(BASHRC)"

# add an entry in user .bashrc to source the extras file
add-extras-to-bashrc: $(BASHRC)
	@if ! $$(grep -q '.bashrc_extras' $(BASHRC)); then \
	echo ">>> Adding entry to .bashrc..." ; \
	echo "source '$(EXTRASLINK)'" >> "$(BASHRC)" ; \
	fi

# press up/down after typing a command on console to search history of just that command
INPUTRC:=$(HOMEDIR)/.inputrc
add-inputrc: $(INPUTRC)
$(INPUTRC): 
	@echo ">>> File $(INPUTRC) does not exist, adding it..."
	@cp inputrc "$(INPUTRC)"



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



# git config --get user.email

# clean:
# 	cd ~ && rm -f .inputrc .bashrc .bashrc_extras