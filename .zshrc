export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="apple"
plugins=(git gh)
source $ZSH/oh-my-zsh.sh

# JAVA
export JAVA_HOME="/Users/tahatesser/jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

# Android SDK
export ANDROID_SDK_ROOT=$HOME/android-sdk
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# Delete .DS_Store files
alias rmds="find . -name ".DS_Store" -print -delete"

# Go language
export PATH=$HOME/go/bin:$PATH
export PATH=/Users/tahatesser/.local/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# API Keys
export OPENAI_API_KEY="<OPENAI_API_KEY>"
export ANTHROPIC_API_KEY="<ANTHROPIC_API_KEY>"
