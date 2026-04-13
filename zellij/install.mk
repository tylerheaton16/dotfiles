.PHONY: zellij
ALL_TARGETS += zellij

zellij:
	./scripts/install_file.sh zellij/config.kdl          $(HOME)/.config/zellij/config.kdl
	./scripts/install_file.sh zellij/nightfox-themes.kdl $(HOME)/.config/zellij/nightfox-themes.kdl
	./scripts/install_file.sh zellij/default.kdl         $(HOME)/.config/zellij/default.kdl
