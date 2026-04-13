.PHONY: xresources-xterm xresources-urxvt
ALL_TARGETS += xresources-xterm

# Default: Xterm. Run 'make xresources-urxvt' to use URxvt instead.
xresources-xterm:
	./scripts/install_file.sh Xresources/.Xresources_xterm $(HOME)/.Xresources
	xrdb $(HOME)/.Xresources

xresources-urxvt:
	./scripts/install_file.sh Xresources/.Xresources_urxvt $(HOME)/.Xresources
	xrdb $(HOME)/.Xresources
