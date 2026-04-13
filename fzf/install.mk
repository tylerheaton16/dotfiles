.PHONY: fzf
ALL_TARGETS += fzf

fzf:
	git -C $(HOME)/.fzf pull 2>/dev/null || git clone https://github.com/junegunn/fzf.git $(HOME)/.fzf
	$(HOME)/.fzf/install
