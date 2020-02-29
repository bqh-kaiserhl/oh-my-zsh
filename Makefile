ZSH=${PWD}
ZSH_TEMPLATE=${PWD}/templates/zshrc.zsh-template

.PHONY: all
all:

.PHONY: install
install:
	if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then \
	  mv -v ~/.zshrc ~/.zshrc.pre-oh-my-zsh; \
	fi
	ln -v -s ${ZSH_TEMPLATE} ~/.zshrc
	chsh -s `which zsh`
	echo "You must log out from the current session."

.PHONY: uninstall
uninstall:
	if [ -h ~/.zshrc ]; then \
	  rm -v ~/.zshrc; \
	fi
	chsh -s /bin/bash
	echo "You must log out from the current session."

.PHONY: update-etc-shells
update-etc-shells:
	@echo `which zsh` >> /etc/shells

.PHONY: reinstall
reinstall: uninstall install
