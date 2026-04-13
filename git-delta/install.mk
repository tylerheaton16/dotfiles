.PHONY: delta
ALL_TARGETS += delta

delta:
	wget https://github.com/dandavison/delta/releases/download/0.11.3/delta-0.11.3-x86_64-unknown-linux-gnu.tar.gz
	tar -xvzf delta-0.11.3-x86_64-unknown-linux-gnu.tar.gz -C $(HOME)/.local/bin --strip-components=1 \
		delta-0.11.3-x86_64-unknown-linux-gnu/delta
	rm delta-0.11.3-x86_64-unknown-linux-gnu.tar.gz
