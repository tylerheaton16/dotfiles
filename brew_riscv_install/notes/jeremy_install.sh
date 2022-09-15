#Install_riscv_tools.sh#####
#Save this script as install_riscv_tools.sh in the #directory you want to put riscv-tools.
#Be sure to allow execute on the script.
#
#chmod +x install_riscv_tools.sh
###########################

git clone https://github.com/freechipsproject/rocket-tools
cd rocket-tools
sed -i 's/build_project riscv-gnu-toolchain --prefix=\$RISCV/build_project riscv-gnu-toolchain --prefix=\$RISCV --without-guile/g' build.sh
git submodule update --init --recursive
export RISCV=$(pwd)
brew install systemd --force-bottle
brew install libusb autoconf automake curl dtc libmpc mpfr gmp gawk bison flex texinfo gperf libtool patchutils bc zlib expat
./build.sh


#!/bin/bash

#This script installs Linux Brew package manager and prepares it for use on Centos 6 (TSS). To use this script:
# 1. Make sure it is executable.
#    chmod +x install_brew.sh
# 2. Once brew is installed source the bash profile.
#    . ~/.bash_profile
# 3. Verify that it is working by entereing the command.
#    brew dr
#    You should get a response like below:
#    Your system is ready to brew.
git clone https://github.com/linuxbrew/brew.git ~/.linuxbrew
#curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /homelinuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH'$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_BUILD_FROM_SOURCE=1 brew install gcc --without-glibc
HOMEBREW_NO_AUTO_UPDATE=1 brew install glibc
# If encountering locale errors in postinstall of glibc, run
# HOMEBREW_NO_AUTO_UPDATE=1 LC_CTYPE=en_GB.UTF-8 brew postinstall glibc
# see issue - https://github.com/Linuxbrew/legacy-linuxbrew/issues/929
HOMEBREW_NO_AUTO_UPDATE=1 brew remove gcc
HOMEBREW_NO_AUTO_UPDATE=1 brew install gcc

brew install git
git -C "/home/$USER/.linuxbrew" remote set-url origin https://github.com/Linuxbrew/brew.git

