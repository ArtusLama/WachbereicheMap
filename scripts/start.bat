@echo off
setlocal enabledelayedexpansion

REM Simple HTTP Server Launcher using npx serve

cls
echo.
echo ===================================
echo    FlipperMap Local Server
echo ===================================
echo.

REM Check if Node.js/npm is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo Error: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    echo.
    pause
    exit /b 1
)

REM Check if we're in the correct directory
if not exist "index.html" (
    echo Error: index.html not found in current directory
    echo Make sure to run this from the release folder
    echo.
    pause
    exit /b 1
)

echo Starting server with npx serve...
echo Open your browser at: http://localhost:3000
echo.

npx serve .


