# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###################
#  i   Colors     #
###################
# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

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
#export TERM=xterm-256color
export TERM=rxvt-unicode-256color
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

fi


# Sets it so that creating more terminals in i3 does not cause text to weirdly rap around the window
shopt -s checkwinsize

# Changes colors for the use@machinename in bash
git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export PS1="\[\033[38;5;231m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\] \w$White\[$(tput sgr0)\] $BPurple\$(git_branch)$Color_Off "


if [ ${USER} == heaton.49 ]; then
    source $HOME/linuxbrew/all_proxy.sh
fi

eval $(dircolors --sh ~/.dircolors)
#export HOMEBREW_NO_ENV_FILTERING=1
#export HOMEBREW_CURLRC=1
export PATH="/home/users/tyler.heaton/dotfiles/git-delta/delta-0.11.3-x86_64-unknown-linux-gnu:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
alias vtags='python $HOME/.vtags-3.01/vtags.py'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
