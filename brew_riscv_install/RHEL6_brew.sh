#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
RCOL="\e[0m"
LINUXBREW="$HOME/.linuxbrew/linuxbrew_custom"
PACKAGES="$LINUXBREW/packages"
GCC_VERSION="gcc-gcc-9_2_0-release"
CURL="curl-7.66.0"
FLEX="flex-2.6.4"
GIT="git-2.1.4"
RUBY="ruby-2.6.3"
GLIBC="glibc-2.14.1"

echo -e "${BLUE}###########################################################################################"
echo -e "${BLUE} This script installs curl, flex, git, ruby, and gcc locally in $PACKAGES"
echo -e "${BLUE} Once installed, gcc is built and the linuxbrew install begins"
echo -e "${BLUE}###########################################################################################"
echo -e "\n"
echo -e "${RED}###########################################################################################"
echo -e "${RED}###########################################################################################"
echo -e "${RED}###########################################################################################"
echo -e "${RED} For all that is good and holy in this world, please. remove. all. PATH changes from your bashrc/cshrc/zsh.... etc "
echo -e "${RED} For all that is good and holy in this world, please. remove. all. PATH changes from your bashrc/cshrc/zsh.... etc "
echo -e "${RED} For all that is good and holy in this world, please. remove. all. PATH changes from your bashrc/cshrc/zsh.... etc "
echo -e "${RED} For all that is good and holy in this world, please. remove. all. PATH changes from your bashrc/cshrc/zsh.... etc "
echo -e "${RED} For all that is good and holy in this world, please. remove. all. PATH changes from your bashrc/cshrc/zsh.... etc "
echo -e "${RED}###########################################################################################"
echo -e "${RED}###########################################################################################"
echo -e "${RED}###########################################################################################"

echo -e "${GREEN} Enter 1 to continue. All other keys to backout so you can ${RED}remove. PATH. change"
read -p 'I promise I removed changes to PATH. I swear: ' confirmation

if [ "$confirmation" == 1 ]
 then

 if [ ! -d $LINUXBREW ]
 then
    echo -e "${GREEN}Creating linuxbrew_install DIR in $HOME"
    mkdir -p $LINUXBREW
 fi

 if [ ! -d $LINUXBREW/packages ]
 then
    mkdir -p $LINUXBREW/packages
 fi

cp ./curl-7.66.0.tar.gz $PACKAGES
cp ./flex-2.6.4.tar.gz $PACKAGES
cp ./git-2.1.4.tar.gz $PACKAGES
cp ./ruby-2.6.3.tar.gz $PACKAGES
cp ./gcc-gcc-9_2_0-release.tar.gz $PACKAGES
cp ./glibc-2.14.1.tar.gz $PACKAGES
pushd .


echo -e "${GREEN} Untarring needed build packages ${RCOL}"
for file in *.tar.gz; do tar -xzf $file -C $PACKAGES; done

if [ ! -d $LINUXBREW/local ]
 then
  mkdir -p $LINUXBREW/local
fi

echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN} Building CURL "
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################${RCOL}"

cd $PACKAGES/$CURL/
./configure --prefix=$LINUXBREW/curl_local
make -j8
make install

echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN} Building FLEX "
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################${RCOL}"

cd $PACKAGES/$FLEX/
./configure --prefix=$LINUXBREW/local
make -j8
make install

echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN} Building RUBY "
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################${RCOL}"

cd $PACKAGES/$RUBY/
./configure --prefix=$LINUXBREW/local
make -j8
make install

echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN} Building GIT "
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################${RCOL}"

cd $PACKAGES/$GIT/
./configure --prefix=$LINUXBREW/local --with-curl=/$LINUXBREW/curl_local
make -j8
make install

echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN} Building GCC "
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################${RCOL}"
echo -e "${BLUE} Installing MPC, MPFR, GMP${RCOL}"

#export PATH="$LINUXBREW/local/bin:$PATH"
cd $PACKAGES/${GCC_VERSION}
source $PACKAGES/${GCC_VERSION}/contrib/download_prerequisites
./configure --prefix=$LINUXBREW/local --disable-multilib
make -j8
make install

echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN} Build GLIBC "
echo -e "${GREEN}###########################################################################################"
echo -e "${GREEN}###########################################################################################${RCOL}"
cd $PACKAGES/${GLIBC}
mkdir build
cd build
.././configure --prefix=$LINUXBREW/packages/glibc-2.14.1/build
make -j8
make install

export PATH="$LINUXBREW/local/bin:$PATH"
export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="$HOME/.linuxbrew/sbin:$PATH"
export HOMEBREW_NO_ENV_FILTERING=1
export HOMEBREW_GIT_PATH="$LINUXBREW/local/bin/git"
popd
ruby ./brew_install.rb

#------------------------------------------------------------------------------#
#        glibc install might not be necessary anymore but left in here         #
#------------------------------------------------------------------------------#
  echo -e "${GREEN}###########################################################################################"
  echo -e "${GREEN} glibc install should fail right here."
  echo -e "${GREEN} gcc symlink created at $HOME/.linuxbrew/opt/binutils/bin to fix glibc error"
  echo -e "${GREEN}###########################################################################################"
ln -s $LINUXBREW/local/bin/gcc $HOME/.linuxbrew/opt/binutils/bin

#------------------------------------------------------------------------------#
#                     Create symlink to fix GLIBC 2_14 bug                     #
#------------------------------------------------------------------------------#
export PATH="$LINUXBREW/local/bin:$PATH"
export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="$HOME/.linuxbrew/sbin:$PATH"
ln -s $LINUXBREW/packages/$GLIBC/build/libc.so.6 $HOME/.linuxbrew/lib/
brew uninstall gcc
brew install openssl
brew update
brew install glibc
brew link --overwrite glibc
brew uninstall gcc
brew install gcc
brew link --overwrite gcc
brew install git

 else
  echo -e "${BLUE}###########################################################################################"
  echo -e "${BLUE} EXITING"
  echo -e "${BLUE}###########################################################################################"
fi

source ./riscv_install.sh
