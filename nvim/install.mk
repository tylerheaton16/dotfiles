.PHONY: nvim nvim-download
ALL_TARGETS += nvim

# Download the nvim AppImage (Linux only). Not run by default — call explicitly.
nvim-download:
	wget https://github.com/neovim/neovim-releases/releases/download/v0.12.0/nvim-linux-x86_64.appimage
	cargo install --locked tree-sitter-cli
	mv nvim-linux-x86_64.appimage $(HOME)/.local/bin/nvim
	chmod u+x $(HOME)/.local/bin/nvim

nvim:
	./scripts/install_file.sh nvim/init.lua                    $(HOME)/.config/nvim/init.lua
	./scripts/install_file.sh nvim/lua/config/vtags.lua        $(HOME)/.config/nvim/lua/config/vtags.lua
	./scripts/install_file.sh nvim/lua/plugins/coding.lua      $(HOME)/.config/nvim/lua/plugins/coding.lua
	./scripts/install_file.sh nvim/lua/plugins/lsp.lua         $(HOME)/.config/nvim/lua/plugins/lsp.lua
	./scripts/install_file.sh nvim/lua/plugins/nightfox.lua    $(HOME)/.config/nvim/lua/plugins/nightfox.lua
	./scripts/install_file.sh nvim/lua/plugins/treesitter.lua  $(HOME)/.config/nvim/lua/plugins/treesitter.lua
	./scripts/install_file.sh nvim/lua/plugins/utils.lua       $(HOME)/.config/nvim/lua/plugins/utils.lua
	./scripts/install_file.sh nvim/lua/plugins/fugitive.lua    $(HOME)/.config/nvim/after/syntax/fugitive.lua
	./scripts/install_file.sh nvim/lua/plugins/git.lua         $(HOME)/.config/nvim/after/syntax/git.lua
