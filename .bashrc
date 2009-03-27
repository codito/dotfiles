#
# Bash config
# Created: Aug 2005
# Last Modified: Sat 28 Mar 2009 02:49:37 AM IST
#

## Pure bash {{{1
# Appearance {{{2
export PS1='\[\033k\033\\\][\u@\h \w]\n\# \$ '

# Completion {{{2
if [-f /etc/bash_completion ]
then
    . /etc/bash_completion
fi

shopt -s cdspell    # correct cs misspells
shopt -s extglob    # extra pattern matching @ ?,*,+,@,!

## Globals {{{1
# Env variables {{{2
PATH=$PATH:~/bin
CDPATH=$CDPATH:~/src:~/tmp
export EDITOR=/usr/bin/vim

# Aliases {{{2
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias ll="ls --color=auto -lh"
alias cd..="cd .."
alias md="mkdir"

# vim: fdm=marker
# EOF
