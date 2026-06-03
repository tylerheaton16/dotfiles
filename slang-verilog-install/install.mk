.PHONY: slang
ALL_TARGETS += slang

slang:
	[ -d slang-verilog-install/slang-server ] || \
		git clone https://github.com/hudson-trading/slang-server.git slang-verilog-install/slang-server
	cd slang-verilog-install/slang-server && \
		git submodule update --init --recursive && \
		cmake -B build -DCMAKE_BUILD_TYPE=Release && \
		cmake --build build -j --target slang_server
	ln -sf $(PWD)/slang-verilog-install/slang-server/build/bin/slang-server $(HOME)/.local/bin/slang-server
