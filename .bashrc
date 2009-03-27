# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim

# Shell display
#PS1='[\u@\h \W]\$ '
export PS1='\[\033k\033\\\][\u@\h \W]\$ '

# My Aliases
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias ll="ls --color=auto -lh"
alias cd..="cd .."
alias md="mkdir"
#alias wget="/usr/bin/wget --http-user='04it06' --http-password='papulu98445'"

PATH=$PATH:/usr/local/bin:/home/arun/bin:/opt/kde/bin:/opt/kdemod/bin
ANT_HOME="/usr/java/ant-1.7.0"
JRE_HOME="/opt/java/jre"
JAVA_HOME="/opt/java"
JAVA_FONTS="/usr/share/fonts/truetype"
export JAVA_HOME
export JAVA_FONTS
export PATH
export JRE_HOME
export ANT_HOME
export CLASSPATH=.

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/e17/lib/pkgconfig:"/usr/local/lib/pkgconfig"
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/e17/lib:"/usr/local/lib"
export PKG_CONFIG_PATH
export LD_LIBRARY_PATH
