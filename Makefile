CWD = $(shell pwd)

.PHONY: nvim tmux zsh

all: nvim tmux zsh

kitty:
	rm -rf ~/.config/kitty/kitty.conf
	ln -s $(CWD)/kitty.conf ~/.config/kitty/kitty.conf

nvim:
	rm -rf ~/.config/nvim
	ln -s $(CWD)/nvim ~/.config/nvim

tmux:
	rm -rf ~/.config/tmux
	ln -s $(CWD)/tmux ~/.config/tmux

zsh:
	rm -rf ~/.config/zsh
	ln -s $(CWD)/zsh ~/.config/zsh
