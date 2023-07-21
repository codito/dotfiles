# ZSH env file
# sourced for all terminals
# Created: Sat 29 Nov 2008 12:14:40 PM IST
# Last Modified: 16/06/2023, 23:16:00 +0530

export EDITOR="nvim"
export PATH=${PATH}:$HOME/bin:$HOME/.yarn/bin
#PYTHONHOME="/usr:/usr"

# Python VirtualEnv
# pipenv: use .venv directory in project for virtual environments
export PIPENV_VENV_IN_PROJECT=1
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
#export WORKON_HOME=/misc/sandbox/virtualenvs
#source /usr/bin/virtualenvwrapper.sh

# VirtualEnv + Pip goodness
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
#export PIP_RESPECT_VIRTUALENV=true

# Nodejs
#export NODE_PATH=/usr/lib/jsctags:/usr/lib/node_modules

# android setup
if [ -d /store/src/_tools/android-sdk ]; then
    export ANDROID_SDK_ROOT=/store/src/_tools/android-sdk
fi

# dotnet setup
if [ -x "$(command -v dotnet)" ]; then
    export MSBuildSDKsPath=/usr/share/dotnet/sdk/$(dotnet --version)/Sdks
fi

# add yarn global dir to path
if [ -x "$(command -v yarn)" ]; then
    export PATH="$(yarn global bin):$PATH"
fi
