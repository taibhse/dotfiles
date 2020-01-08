#!/bin/bash

#Sets vi mode in my terminal
set -o vi

# Aliases
alias ll="ls -lG"
alias applications="cd /Applications"
alias down="cd ~/Downloads"
alias desktop="cd ~/Desktop"
alias finder="open -a Finder ."
alias countfiles="ls -AF | grep -vc [/,@]"
alias countall="ls -AF | grep -vc @"
alias notes="cd ~/Documents/notes"
alias newkey="ruby -e 'require \"securerandom\" ; puts SecureRandom.hex(40/2)'"
alias fuck='sudo $(history -p \!\!)'
alias reload="source ~/.bash_profile"
alias rb="ssh chris@redbrick.dcu.ie"
alias rs='tmux attach'
alias ovh="ssh chris@taibhse.eu"

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


# Colours
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

#Work config
if [ -f ~/.work ]; then
   source ~/.work
fi
