# Installs the linuxbrew tools
source /opt/rh/rh-git29/enable
source /opt/rh/devtoolset-8/enable
export HOMEBREW_NO_ENV_FILTERING=1
export HOMEBREW_CURLRC=1

#echo "insecure" >> ~/.curlrc
echo "export HOMEBREW_NO_ENV_FILTERING=1" >> ~/.bashrc
echo "export HOMEBREW_CURLRC=1" >> ~/.bashrc
echo "export PATH=\$HOME/.linuxbrew/bin:\$PATH" >> ~/.bashrc
echo "export PATH=\$HOME/.linuxbrew/sbin:\$PATH" >> ~/.bashrc

/usr/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Update and upgrade in case anything is left over 
export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="$HOME/.linuxbrew/sbin:$PATH"
brew update
brew upgrade
# yes you have to do this
brew uninstall gcc
brew uninstall glibc
brew install glibc
brew install gcc
brew install git

#------------------------------------------------------------------------------#
#                     Allows you to install fonts you want                     #
#------------------------------------------------------------------------------#
brew tap linuxbrew/fonts

