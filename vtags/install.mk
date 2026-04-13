# NOTE: vtags is deprecated — it is now a Neovim plugin. Keep VTAGS=0 in cfg.mk.
.PHONY: vtags
ALL_TARGETS += vtags

vtags:
	curl -o $(HOME)/vtags-3.01.tar.gz "https://www.vim.org/scripts/download_script.php?src_id=26794"
	cd $(HOME) && tar -xvzf vtags-3.01.tar.gz && rm vtags-3.01.tar.gz && mv vtags-3.01 .vtags-3.01
	cp vtags/vtags_vim_api.vim $(HOME)/.vtags-3.01/
