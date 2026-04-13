ifeq (,$(wildcard cfg.mk))
$(error cfg.mk not found. Create one: cp cfg.mk.default cfg.mk)
endif

.DEFAULT_GOAL := all

include cfg.mk

ALL_TARGETS :=

ifeq ($(NVIM),1)
include nvim/install.mk
endif

ifeq ($(ZELLIJ),1)
include zellij/install.mk
endif

ifeq ($(BASH),1)
include bash_aliases/install.mk
endif

ifeq ($(DIRCOLORS),1)
include dircolors/install.mk
endif

ifeq ($(XRESOURCES),1)
include Xresources/install.mk
endif

ifeq ($(FZF),1)
include fzf/install.mk
endif

ifeq ($(VTAGS),1)
include vtags/install.mk
endif

ifeq ($(DELTA),1)
include git-delta/install.mk
endif

ifeq ($(TMUX),1)
include tmux/install.mk
endif

ifeq ($(ELISP),1)
include elisp/install.mk
endif

ifeq ($(RUST),1)
include rust/install.mk
endif

.PHONY: all $(ALL_TARGETS)
all: $(ALL_TARGETS)
