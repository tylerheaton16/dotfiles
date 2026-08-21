.PHONY: ghostty ghostty-ext-keyboard ghostty-mac-keyboard
ALL_TARGETS += ghostty

ghostty-setup:
	./scripts/install_dir.sh  ghostty/themes ~/.config/ghostty/themes
	./scripts/install_dir.sh  ghostty/global ~/.config/ghostty/global

ghostty: ghostty-setup
	./scripts/install_file.sh ghostty/config-mac-keyboard ~/.config/ghostty/config

ghostty-ext-keyboard: ghostty-setup
	./scripts/install_file.sh ghostty/config-ext-keyboard  ~/.config/ghostty/config


