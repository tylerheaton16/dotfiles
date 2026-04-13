.PHONY: bash
ALL_TARGETS += bash

bash:
	./scripts/install_file.sh .bash_aliases $(HOME)/.bash_aliases
