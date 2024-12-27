export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="apple"
plugins=(git flutter alias-finder gh brew)
source $ZSH/oh-my-zsh.sh

# JAVA
export JAVA_HOME="/Applications/Android Studio Preview.app/Contents/jbr/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin

# Android SDK
export ANDROID_SDK_ROOT=$HOME/android-sdk
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# Flutter, Dart, and FVM
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/fvm/versions/custom_flutter/bin"
export PATH="$PATH":"$HOME/fvm/versions/custom_flutter/bin/cache/dart-sdk/bin"
export FLUTTER_GIT_URL="https://github.com/TahaTesser/flutter.git"
export FVM_FLUTTER_URL="https://github.com/TahaTesser/flutter.git"

# Flutter source and sample aliases
alias ffp="cd ~ && cd $HOME/fvm/versions/custom_flutter/packages/flutter && flutter pub get"
alias fpp="cd ~ && cd $HOME/Code/flutter_playground && flutter pub get"
alias m3gen="dart $HOME/fvm/versions/custom_flutter/dev/tools/gen_defaults/bin/gen_defaults.dart"

# Editor aliases
alias vs="code ."
alias cr="cursor ."

# API Keys
export OPENAI_API_KEY="<OPENAI_API_KEY>"
export ANTHROPIC_API_KEY="<ANTHROPIC_API_KEY>"
