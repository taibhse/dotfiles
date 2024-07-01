#bash_profile is for login shells

#Aliases
alias down="cd ~/Downloads"
alias cleand="rm -rf ~/Downloads/*"
alias wet='curl "https://wttr.in/dublin?metric"'


# Adding bash prompt colour
export PS1="\[\e[31m\]\u\[\e[m\]@\[\e[34m\]\h \[\e[m\]\[\e[33m\]\w\[\e[m\] \[\e[31m\]\\$\[\e[m\] "


#Adding colour to ls and adding ll
alias ls='ls -G'
alias ll='ls -lG'


# Importing configuration for work
if [ -f ~/.work ]; then
   source ~/.work
fi
