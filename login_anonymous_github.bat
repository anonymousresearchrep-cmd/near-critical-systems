@echo off

echo ========================================
echo LOGIN TO ANONYMOUS GITHUB ACCOUNT
echo ========================================
echo.
echo This script will log out the current GitHub CLI account
echo and start browser login for the anonymous account.
echo.
echo IMPORTANT:
echo In the browser, log in as:
echo anonymousresearchrep-cmd
echo.
pause

echo.
echo Logging out current GitHub CLI account...
gh auth logout --hostname github.com

echo.
echo Starting GitHub CLI login...
echo Choose:
echo   GitHub.com
echo   HTTPS
echo   Login with browser
echo.
gh auth login --hostname github.com --git-protocol https --web

echo.
echo Checking authentication status...
gh auth status

echo.
echo ========================================
echo VERIFY ABOVE:
echo It must say account anonymousresearchrep-cmd
echo ========================================
echo.
pause
