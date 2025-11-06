#!/bin/bash

# Simple HTTP Server Launcher using npx serve
#
# Usage: ./serve.sh
# The site will be accessible at http://localhost:3000

echo ""
echo "==================================="
echo "    FlipperMap Local Server"
echo "==================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is not installed"
    echo "Please install Node.js from https://nodejs.org/"
    echo ""
    exit 1
fi

# Check if we're in the correct directory
if [ ! -f "index.html" ]; then
    echo "Error: index.html not found in current directory"
    echo "Make sure to run this from the release folder"
    echo ""
    exit 1
fi

echo "Starting server with npx serve..."
echo ""
echo "Open your browser at: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

npx serve .
