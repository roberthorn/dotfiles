CWD = $(shell pwd)

.PHONY: aerospace
aerospace:
	rm -rf ~/.config/aerospace
	ln -s $(CWD)/aerospace ~/.config/aerospace

.PHONY: direnv
direnv:
	rm -rf ~/.config/direnv
	ln -s $(CWD)/direnv ~/.config/direnv

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

.PHONY: wezterm
wezterm:
	rm -rf ~/.config/wezterm
	ln -s $(CWD)/wezterm ~/.config/wezterm

.PHONY: zsh
zsh:
	rm -rf ~/.config/zsh
	ln -s $(CWD)/zsh ~/.config/zsh

.PHONY: install
install: aerospace direnv git hammerspoon nvim tmux wezterm zsh
