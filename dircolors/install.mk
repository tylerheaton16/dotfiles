.PHONY: dircolors
ALL_TARGETS += dircolors

dircolors:
	./scripts/install_file.sh .dircolors $(HOME)/.dircolors
