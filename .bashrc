# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################Aliasing##################
alias ls='ls --color=auto'
alias vi='vim'
alias ll='ls -la'
alias la='ls -a'
alias dirs='dirs -v'
alias matlab='matlab -nosplash -nodesktop'
alias grep='grep --color=yes'
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc'
alias ..="cd ../"
alias ....="cd ../../"
alias ......="cd ../../../"
taskvim='vim -c "TW" -c "Calendar -view=year -split=horizontal -position=below -height=26"'
alias vimgit="vim -c \":Git\" -c \":only\""
alias vimlog="vim -c \":Git log\" -c \":only\""
#################PATH Updates##############

# Configures fuzzy finder 

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border rounded --color fg:#00bfe5,fg+:#00bfe5,bg:#000000,preview-bg:#000000,border:#00bfe5 --preview "
                                                                 [[ $(file --mime {}) =~ binary ]] &&
                                                                    echo {} is a binary file ||
                                                                   (rougify highlight {} ||
                                                                     cat {}) 2> /dev/null | head -500"'




set -o vi
export TERM=xterm-256color
#export TERM=rxvt-unicode-256color
if [ ${USER} == "tylerheaton16" ]; then
  #archey3 --color=cyan
  export PATH="$HOME/AUR/matlab/bin:$PATH"
  export PATH="$HOME/.local/rouge/bin/:$PATH"
  #source /home/tim/.fzf/shell/completion.bash
  export PATH="$HOME/.fzf/bin/:$PATH"
  #source ~/.colors
  #source ~/.functions.sh
  export LESSOPEN="| $HOME/.local/rouge/bin/rougify %s 2> /dev/null"                        
  export LESS="-R"
  export EDITOR="/usr/bin/vim"
  export VISUAL="/usr/bin/vim"
fi

# TSS Only
if [[ ${USER} == "tylerheaton16" ]]
 then
  alias vtags='python $HOME/.vtags-3.01/vtags.py'
  export PATH="$HOME/.fzf/bin:$PATH"
  export PATH="$HOME/.linuxbrew/opt/perl/bin:$PATH"
  export PATH="$HOME/.linuxbrew/opt/texlive/texlive/bin/x86_64-linux:$PATH"
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export PATH="$HOME/.linuxbrew/sbin:$PATH"
  export PATH="$HOME/.rxvt-unicode-9.22/bin:$PATH"
  export PATH="$HOME/timh_chipyard/verilator/bin:$PATH"
  export RISCV="$HOME/rocket-tools"
  export PATH="$HOME/rocket-tools/bin:$PATH"
  export HOMEBREW_TEMP=$HOME/.linuxbrew_tmp
  export EDITOR="$HOME/.linuxbrew/bin/vim"
  export VISUAL="$HOME/.linuxbrew/bin/vim"
  export TMUX_TMPDIR=$HOME/.linuxbrew_tmp
  unset TMOUT
  export CDPATH="$HOME/timh_build3a/socta1_chipyard/generators:$CDPATH"
  # The order of these 2 commands matters
  [[ -r "/home/tim.heaton/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/tim.heaton/.linuxbrew/etc/profile.d/bash_completion.sh"
  source $HOME/.fzf/shell/completion.bash

  if [ -f "$HOME/Tim_Project_Temporary" ]
   then
    source ~/Tim_Project_Temporary/source_file/brew_riscv_install/path_update.sh
    export PATH="/home/tim.heaton/Tim_Project_Temporary/packages/rouge/bin:$PATH"
    export PATH="/home/tim.heaton/Tim_Project_Temporary/packages/binmake/bin:$PATH"
    export RISCV="/home/tim.heaton/Tim_Project_Temporary/source_file/brew_riscv_install/rocket-tools"
   fi
fi


# Sets it so that creating more terminals in i3 does not cause text to weirdly rap around the window
shopt -s checkwinsize

# Changes colors for the use@machinename in bash

export PS1="\[\033[38;5;231m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;231m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;231m\]\w]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

if [ ${USER} == heaton.49 ]; then
    source $HOME/linuxbrew/all_proxy.sh
fi

eval $(dircolors --sh ~/.dircolors)
#export HOMEBREW_NO_ENV_FILTERING=1
#export HOMEBREW_CURLRC=1
export PATH="/home/heaton.48/.linuxbrew/bin:$PATH"
export PATH="/home/heaton.48/.linuxbrew/sbin:$PATH"
export PATH="/home/heaton.48/.fzf/bin:$PATH"
export PATH="/home/heaton.48/tools/verilator_bin/bin:$PATH"
export RISCV="/home/heaton.48/rocket-tools"

#if [ ${USER} == heaton.48 ]; then
#    source $HOME/linuxbrew/all_proxy.sh
#fi
#export HOMEBREW_TEMP=/home/heaton.48/.linuxbrew_tmp

alias genus="genus -log `git rev-parse --show-toplevel --quiet 2>/dev/null`/logs/genus"
alias innovus="innovus -log `git rev-parse --show-toplevel --quiet 2>/dev/null`/logs/"
alias socta1b3a="export DESIGN=socta1b3a_top && source scripts/setenv"
alias centaurus="export DESIGN=centaurus_top && source scripts/setenv"
alias efpga="export DESIGN=AXI4FPGACrossingWrapper && source scripts/setenv"
alias taaes="export DESIGN=AXI4TAAES && source scripts/setenv"
alias aes="export DESIGN=AXI4AES && source scripts/setenv"
alias aes1="export DESIGN=AXI4AES_1 && source scripts/setenv"
alias aes2="export DESIGN=AXI4AES_2 && source scripts/setenv"
alias aes3="export DESIGN=AXI4AES_3 && source scripts/setenv"
alias aes4="export DESIGN=AXI4AES_4 && source scripts/setenv"
alias aes5="export DESIGN=AXI4AES_5 && source scripts/setenv"
alias rocket="export DESIGN=RocketTile && source scripts/setenv"
alias boom="export DESIGN=BoomTile && source scripts/setenv"
alias ddr="export DESIGN=ddr_chip && source scripts/setenv"
alias sram="export DESIGN=AXI4SinglePortRAM && source scripts/setenv"
alias gen="genus -log `git rev-parse --show-toplevel --quiet 2>/dev/null`/logs/genus"
alias inn="innovus -stylus -log `git rev-parse --show-toplevel --quiet 2>/dev/null`/logs/"
alias aesobf="export DESIGN=AXI4AES_obf && source scripts/setenv"

if [ ${USER} == heaton.48 ]; then
    source $HOME/linuxbrew/all_proxy.sh
fi
export HOMEBREW_TEMP=/home/heaton.48/.linuxbrew_tmp

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/heaton.48/.sdkman"
[[ -s "/home/heaton.48/.sdkman/bin/sdkman-init.sh" ]] && source "/home/heaton.48/.sdkman/bin/sdkman-init.sh"
source $HOME/.bash_aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
