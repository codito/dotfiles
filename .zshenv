# ZSH env file
# sourced for all terminals
# Created: Sat 29 Nov 2008 12:14:40 PM IST
# Last Modified: 26/11/2026, 10:12:58 +0530

export EDITOR="nvim"
export PATH=${PATH}:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$HOME/bin

# Nodejs
#export NODE_PATH=/usr/lib/jsctags:/usr/lib/node_modules
export NODE_OPTIONS=--max-old-space-size=8192

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

# Webkit gtk view workaround. Needed for Tauri apps like en-croissant
# https://github.com/tauri-apps/tauri/issues/13493
export WEBKIT_DISABLE_DMABUF_RENDERER=1

# Create virtual env at .venv dir
export PYTHON_VENV_NAME=.venv

# SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/rbw/ssh-agent-socket"

source ~HOME/.config/.env
