# 1) Build Flex
# ./configure --prefix=$HOME/
# 2) Build Curl
# 3) Build Git
#./configure --prefix=/home/tim.heaton/Tim_Project_Temporary/source_file/brew_install/local --with-curl/home/tim.heaton/Tim_Project_Temporary/source_file/brew_install/local



export LDFLAGS="-L/home/tim.heaton/.linuxbrew/opt/isl@0.18/lib"
export CPPFLAGS="-I/home/tim.heaton/.linuxbrew/opt/isl@0.18/include"
export PKG_CONFIG_PATH="/home/tim.heaton/.linuxbrew/opt/isl@0.18/lib/pkgconfig"

# Custom build gcc
# symlink gcc into linuxbrew bin

