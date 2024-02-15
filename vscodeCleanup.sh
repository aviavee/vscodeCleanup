#!/bin/bash

# Find all processes running from /root/.vscode-server and kill them
# Uses pgrep to find processes based on their full command line
# Then, uses kill to terminate each process found
pgrep -f '/root/.vscode-server' | while read -r pid; do
    echo "Killing process $pid"
    kill -9 "$pid"
done

# Remove VS Code Server directories
echo "Removing VS Code Server directories..."
rm -rf /root/.vscode-server
rm -rf /home/*/.vscode-server  # Adjust if VS Code Server is installed for other users

# Optional: Remove temporary or cache files
echo "Cleaning up temporary files..."
rm -rf /tmp/vscode-remote-containers-server-*

echo "VS Code Server cleanup complete."