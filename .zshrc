export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="apple"
plugins=(git flutter alias-finder gh brew)
source $ZSH/oh-my-zsh.sh

# Flutter aliases
alias f="flutter"
alias fd="flutter doctor -v"
alias fp="flutter pub get"
alias fr="flutter run"
alias ft="flutter test"
# Flutter source and sample aliases
alias ffp="cd ~ && cd $HOME/flutter/packages/flutter && flutter pub get"
alias fpp="cd ~ && cd $HOME/Code/flutter_playground && flutter pub get"
# Editors aliases
alias vs="code ."
alias cr="cursor ."

# JAVA
export JAVA_HOME="/Applications/Android Studio Preview.app/Contents/jbr/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin
# Android
export ANDROID_SDK_ROOT=$HOME/android-sdk
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
# Flutter
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/flutter/bin"
export PATH="$PATH":"$HOME/dart-sdk/bin"
export FLUTTER_GIT_URL="git@github.com:TahaTesser/flutter.git"
# Node
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# API Keys
export OPENAI_API_KEY="<OPENAI_API_KEY>"
export ANTHROPIC_API_KEY="<ANTHROPIC_API_KEY>"
