#!/bin/bash
#source ~/.profile

#echo "bash_profile"

#pull the dotfiles repo to keep everything upto date
#cd ~/dotfiles
#git pull

#Sets vi mode in my terminal
set -o vi

# Aliases
alias ll="ls -l"
alias app="cd ~/Applications"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias desktop="cd ~/Desktop"
alias finder="open -a Finder ."
alias cleand="rm -rf ~/Downloads/*"
alias countfiles="ls -AF | grep -vc [/,@]"
alias countall="ls -AF | grep -vc @"
alias notes="cd ~/Documents/notes"
alias newkey="ruby -e 'require \"securerandom\" ; puts SecureRandom.hex(40/2)'"
alias fuck='sudo $(history -p \!\!)'
alias reload="source ~/.bash_profile"
alias rb="ssh chris@redbrick.dcu.ie"
alias rs='tmux attach'
alias ovh="ssh chris@taibhse.eu"
alias unfuck-git='git clean -xdf; git reset --hard HEAD; git fetch origin; git reset --hard origin'

# Update local files
function update(){
    git -C ~/dotfiles pull    
}

# Git stuff
function parse_git_dirty {
 [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes


# Colours
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

cd ~
