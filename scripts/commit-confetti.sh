#!/bin/bash

echo "Setting up Commit Confetti..."

# Setup Commit Confetti
# Clone this repository or download the setup_commit_confetti.sh script
git clone https://github.com/TahaTesser/CommitConfetti.git "$HOME/CommitConfetti"
cd "$HOME/CommitConfetti" || exit

# Make the script executable
chmod +x setup_commit_confetti.sh

# Run the setup script
./setup_commit_confetti.sh

# Clean up
cd "$HOME" || exit
rm -rf "$HOME/CommitConfetti"

echo "Commit Confetti setup complete!"