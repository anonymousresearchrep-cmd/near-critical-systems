@echo off

echo ========================================
echo PREPARING ANONYMOUS GITHUB REPOSITORY
echo ========================================

git config --local user.name "Anonymous Researcher"
git config --local user.email "anonymousresearchrep@gmail.com"

echo.
echo Removing old origin if it exists...
git remote remove origin 2>nul

echo.
echo Adding anonymous remote...
git remote add origin https://github.com/anonymousresearchrep-cmd/near-critical-systems.git

echo.
echo Current git config:
git config --local --list

echo.
echo Current remotes:
git remote -v

echo.
echo DONE.
pause
