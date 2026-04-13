.PHONY: tmux
ALL_TARGETS += tmux

tmux:
	./scripts/install_file.sh .tmux.conf $(HOME)/.tmux.conf
