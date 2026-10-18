@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js 24 or newer is required to run Mon Lexique.
  pause
  exit /b 1
)
node server\launcher.mjs
if errorlevel 1 (
  echo.
  echo Mon Lexique could not start. See the message above.
  pause
  exit /b 1
)
start "" "http://127.0.0.1:4173/"
