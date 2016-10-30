# ZSH env file
# sourced for all terminals
# Created: Sat 29 Nov 2008 12:14:40 PM IST
# Last Modified: 01/05/2016, 18:21:20 IST

EDITOR="vim"
PATH="$PATH:$HOME/bin"
PYTHONHOME="/usr:/usr"

# Python VirtualEnv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
export WORKON_HOME=/misc/sandbox/virtualenvs
source /usr/bin/virtualenvwrapper.sh

# VirtualEnv + Pip goodness
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# Nodejs
export NODE_PATH=/usr/lib/jsctags:/usr/lib/node_modules
