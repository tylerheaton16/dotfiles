#
# ~/.bash_profile
#


# To avoid potential situation where cdm(1) crashes on every TTY, here we
# default to execute cdm(1) on tty1 only, and leave other TTYs untouched.
# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then 
	 exec startx
fi
