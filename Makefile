CWD = $(shell pwd)

.PHONY: aerospace
aerospace:
	rm -rf ~/.config/aerospace
	ln -s $(CWD)/aerospace ~/.config/aerospace

.PHONY: claude
claude:
	rm -rf ~/.claude
	ln -s $(CWD)/claude ~/.claude

.PHONY: ghostty
ghostty:
	rm -rf ~/.config/ghostty
	ln -s $(CWD)/ghostty ~/.config/ghostty

.PHONY: git
git:
	rm -rf ~/.config/git
	ln -s $(CWD)/git ~/.config/git

.PHONY: hammerspoon
hammerspoon:
	rm -rf ~/.hammerspoon
	ln -s $(CWD)/hammerspoon ~/.hammerspoon

.PHONY: nvim
nvim:
	rm -rf ~/.config/nvim
	ln -s $(CWD)/nvim ~/.config/nvim

.PHONY: scripts
scripts:
	rm -rf ~/.bin
	ln -s $(CWD)/bin ~/.bin

.PHONY: tmux
tmux: tpm-install
	rm -rf ~/.config/tmux
	ln -s $(CWD)/tmux ~/.config/tmux

.PHONY: tpm-install
tpm-install:
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

.PHONY: zsh
zsh:
	rm -rf ~/.config/zsh
	ln -s $(CWD)/zsh ~/.config/zsh

.PHONY: install
install: aerospace claude ghostty git hammerspoon nvim tmux zsh
