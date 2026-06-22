@echo off

echo ========================================
echo ANONYMOUS PUSH TO GITHUB
echo ========================================

echo.
echo Checking GitHub authentication...
gh auth status

echo.
echo ========================================
echo VERIFY ACCOUNT ABOVE
echo It must be:
echo anonymousresearchrep-cmd
echo ========================================
echo.

pause

git status

echo.
git branch

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo PUSH FINISHED
pause
