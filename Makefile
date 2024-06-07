CWD = $(shell pwd)

.PHONY: nvim tmux zsh direnv git kitty hammerspoon aerospace

all: nvim tmux zsh direnv git kitty hammerspoon aerospace

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

hammerspoon:
	rm -rf ~/.hammerspoon
	ln -s $(CWD)/hammerspoon ~/.hammerspoon
	
aerospace:
	rm -rf ~/.config/aerospace
	ln -s $(CWD)/aerospace ~/.config/aerospace
