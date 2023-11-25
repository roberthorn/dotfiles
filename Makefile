CWD = $(shell pwd)

.PHONY: nvim tmux zsh

all: nvim tmux zsh

nvim:
	rm -rf ~/.config/nvim
	ln -s $(CWD)/nvim ~/.config/nvim

tmux:
	rm -rf ~/.config/tmux
	ln -s $(CWD)/tmux ~/.config/tmux

zsh:
	rm -rf ~/.config/zsh
	ln -s $(CWD)/zsh ~/.config/zsh
