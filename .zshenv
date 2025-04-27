# ZSH env file
# sourced for all terminals
# Created: Sat 29 Nov 2008 12:14:40 PM IST
# Last Modified: 03/04/2025, 16:12:01 +0530

export EDITOR="nvim"
export PATH=${PATH}:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$HOME/bin

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

# aider
export AIDER_ANALYTICS_DISABLE=true

export WLR_RENDERER=vulkan
export HF_HOME=$HOME/.local/share/huggingface

# Create virtual env at .venv dir
export PYTHON_VENV_NAME=.venv

source ~HOME/.config/.env
