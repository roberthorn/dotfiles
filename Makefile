CWD = $(shell pwd)

.PHONY: aerospace direnv git hammerspoon kitty nvim tmux zsh

all: aerospace direnv git hammerspoon kitty nvim tmux zsh

aerospace:
	rm -rf ~/.config/aerospace
	ln -s $(CWD)/aerospace ~/.config/aerospace

direnv:
	rm -rf ~/.config/direnv
	ln -s $(CWD)/direnv ~/.config/direnv

git:
	rm -rf ~/.config/git
	ln -s $(CWD)/git ~/.config/git

hammerspoon:
	rm -rf ~/.hammerspoon
	ln -s $(CWD)/hammerspoon ~/.hammerspoon

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
