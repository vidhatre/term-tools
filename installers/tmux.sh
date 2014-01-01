#!/bin/bash
set -e

## tmux

if command -v tmux >/dev/null 2>&1; then
	echo "tmux: exists"
elif command -v apt-get >/dev/null 2>&1; then
	# ubuntu
	sudo apt-get install -y tmux xclip
elif command -v /opt/local/bin/port >/dev/null 2>&1; then
	# macport
	sudo port install tmux
else
	echo "ERROR: tmux is not installed"
	exit 1
fi

ln $@ -sn ~/term-tools/config/tmux.conf ~/.tmux.conf

## teamocil

if command -v teamocil >/dev/null 2>&1; then
	echo "teamocil: exists"
elif command -v gem >/dev/null 2>&1; then
	sudo gem install teamocil
elif command -v apt-get >/dev/null 2>&1; then
	sudo apt-get install -y ruby1.9.3 rubygems
	sudo gem install teamocil
else
	echo "ERROR: rubygems is not installed"
	exit 1
fi
