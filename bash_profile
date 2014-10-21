source ~/.profile

#pull the dotfiles repo to keep everything uptodate
cd ~/dotfiles
git pull

# Aliases
alias ll="ls -l"
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

# Git stuff
function parse_git_dirty {
 [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


# Colours
export CLICOLOR=1
export PS1='\h:\[\033[0;35m\]\w\[\033[0;36m\]$(parse_git_branch)\[\e[0m\]: '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

cd ~
