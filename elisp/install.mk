.PHONY: elisp
ALL_TARGETS += elisp

elisp:
	./scripts/install_dir.sh .elisp $(HOME)/.elisp
