# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias rb='ssh chris@redbrick.dcu.ie'
alias ovh='ssh root@5.196.0.106'

function parse_git_branch () {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 
 RED="\[\033[0;31m\]"
 YELLOW="\[\033[0;33m\]"
 GREEN="\[\033[0;32m\]"
 NO_COLOR="\[\033[0m\]"
  
  PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
