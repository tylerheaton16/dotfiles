# Feature flags — set to 1 to enable, 0 to disable.
# Run 'make' to install all enabled components.
# Run 'make <target>' to install a single component.

NVIM       = 0
ZELLIJ     = 0
BASH       = 0
DIRCOLORS  = 0
XRESOURCES = 0
FZF        = 0
VTAGS      = 0
DELTA      = 0
TMUX       = 0
ELISP      = 0
RUST       = 0
SLANG      = 0
GHOSTTY    = 1

RUST_PACKAGES := \
	bender \
	tree-sitter-cli \
