# ZSH env file
# sourced for all terminals
# Created: Sat 29 Nov 2008 12:14:40 PM IST
# Last Modified: 20/01/2024, 23:18:17 +0530

export EDITOR="nvim"
export PATH=${PATH}:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/bin
#PYTHONHOME="/usr:/usr"

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
