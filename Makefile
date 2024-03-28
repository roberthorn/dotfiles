CWD = $(shell pwd)

.PHONY: nvim tmux zsh direnv git kitty

all: nvim tmux zsh direnv git kitty

kitty:
	rm -rf ~/.config/kitty
	ln -s $(CWD)/kitty ~/.config/kitty

nvim:
	rm -rf ~/.config/nvim
	ln -s $(CWD)/nvim ~/.config/nvim

tmux:
	rm -rf ~/.config/tmux
	ln -s $(CWD)/tmux ~/.config/tmux

zsh:
	rm -rf ~/.config/zsh
	ln -s $(CWD)/zsh ~/.config/zsh

direnv:
	rm -rf ~/.config/direnv
	ln -s $(CWD)/direnv ~/.config/direnv

git:
	rm -rf ~/.config/git
	ln -s $(CWD)/git ~/.config/git
