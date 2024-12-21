#!/bin/bash

# Define installation directory
INSTALL_DIR="/usr/local"
FLUTTER_DIR="/workspaces/flutter"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Flutter installation...${NC}"

# Check if Flutter exists in /workspaces/flutter
if [ ! -d "$FLUTTER_DIR" ]; then
    echo -e "${RED}Flutter not found in ${FLUTTER_DIR}. Please ensure Flutter is available in this location.${NC}"
    exit 1
fi

echo "Using Flutter from ${FLUTTER_DIR}"

# Check if the Flutter path is already in PATH
FLUTTER_PATH="${FLUTTER_DIR}/bin"

# Function to add Flutter to different shell config files
add_to_shell_config() {
    local config_file="$1"
    
    # Create config file if it doesn't exist
    touch "$config_file"
    
    # Check if Flutter path is already in the config file
    if ! grep -q "export PATH=.*${FLUTTER_PATH}" "$config_file"; then
        echo "export PATH=\$PATH:${FLUTTER_PATH}" >> "$config_file"
        echo -e "${GREEN}Added Flutter to $config_file${NC}"
    else
        echo "Flutter path already exists in $config_file"
    fi
}

# Add Flutter to common shell config files
add_to_shell_config "$HOME/.bashrc"
add_to_shell_config "$HOME/.zshrc"

# Reload shell configurations
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi

echo -e "${GREEN}Flutter has been added to PATH. Please restart your terminal or run 'source ~/.bashrc' (or 'source ~/.zshrc') to apply changes.${NC}"

# Pre-download development binaries
echo "Running initial Flutter setup..."
export PATH="$PATH:${FLUTTER_PATH}"
flutter precache

# Disable Windows, macOS, Android and web configurations
echo "Disabling Windows, macOS, Android and web configurations..."
flutter config --no-enable-windows-desktop
flutter config --no-enable-macos-desktop
flutter config --no-enable-android
flutter config --no-enable-web

# Verify Flutter is accessible
if command -v flutter &> /dev/null; then
    echo -e "${GREEN}Flutter installation verified successfully!${NC}"
    flutter --version
    echo -e "${GREEN}Installation complete! You may need to restart your terminal for changes to take effect.${NC}"
else
    echo -e "${RED}Warning: Flutter command not found. Please check your installation.${NC}"
fi

# Run flutter doctor to check setup
echo "Running flutter doctor..."
flutter doctor
