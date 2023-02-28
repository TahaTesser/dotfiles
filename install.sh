#!/usr/bin/env bash

# Dotfiles for gitpod.

echo "• Updating .bashrc in your: $HOME"
echo '' >> ~/.bashrc 
echo 'export PATH="$PATH":"/workspace/flutter/bin"' >> ~/.bashrc 
echo 'export FLUTTER_GIT_URL="git@github.com:NevercodeHQ/flutter.git"' >> ~/.bashrc 
echo '' >> ~/.bashrc 

echo "• Adding .bash_aliases in your: $HOME"
nano ~/.bash_aliases

echo "• Updating .bash_aliases in your: $HOME"
echo '# aliases' >> ~/.bash_aliases
echo '' >> ~/.bash_aliases 
echo 'alias f="flutter"' >> ~/.bash_aliases
echo 'alias fd="flutter doctor -v"' >> ~/.bash_aliases
echo 'alias fp="flutter pub get"' >> ~/.bash_aliases
echo 'alias fr="flutter run"' >> ~/.bash_aliases
echo 'alias ft="flutter test"' >> ~/.bash_aliases
echo '' >> ~/.bash_aliases 
