git clone https://github.com/freechipsproject/rocket-tools
cd rocket-tools
sed -i 's/build_project riscv-gnu-toolchain --prefix=\$RISCV/build_project riscv-gnu-toolchain --prefix=\$RISCV --without-guile/g' build.sh
git submodule update --init --recursive
export RISCV=$(pwd)
brew install openssl --force-bottle
brew install systemd --force-bottle
brew install autoconf automake curl dtc libmpc mpfr gmp gawk bison flex texinfo gperf libtool patchutils bc zlib expat libusb

# Don't uncomment the following 2 brew commands. Here as a reminder. 
#brew tap riscv/riscv
#brew install riscv-tools
./build.sh
