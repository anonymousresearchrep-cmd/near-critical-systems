@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "REPO_DIR=C:\Users\net42\Downloads\near_critical_systems_repo_clean_checked\near-critical-systems"
set "REMOTE_URL=https://github.com/anonymousresearchrep-cmd/near-critical-systems.git"
set "EXPECTED_ACCOUNT=anonymousresearchrep-cmd"

echo ========================================
echo SAFE INIT + COMMIT + PUSH TO ANONYMOUS GITHUB v2
echo ========================================
echo.
echo Target folder:
echo %REPO_DIR%
echo.

if not exist "%REPO_DIR%" (
  echo ERROR: Target folder does not exist.
  pause
  exit /b 1
)

cd /d "%REPO_DIR%" || (
  echo ERROR: Could not enter target folder.
  pause
  exit /b 1
)

echo Checking that this looks like the repo root...
if not exist "README.md" (
  echo ERROR: README.md not found in this folder.
  echo You may be in the wrong directory. Aborting.
  pause
  exit /b 1
)

echo.
echo Checking GitHub CLI account...
gh auth status 2>&1 | findstr /I "%EXPECTED_ACCOUNT%" >nul
if errorlevel 1 (
  echo ERROR: GitHub CLI is NOT authenticated as %EXPECTED_ACCOUNT%.
  echo Run login_anonymous_github.bat first.
  pause
  exit /b 1
)
echo OK: GitHub CLI appears authenticated as %EXPECTED_ACCOUNT%.
echo.

echo Initializing a LOCAL git repository in this exact folder...
if not exist ".git" (
  git init -b main
) else (
  echo Local .git folder already exists.
)

echo.
echo Verifying git root...
for /f "delims=" %%i in ('git rev-parse --show-toplevel') do set "GITROOT=%%i"

rem Normalize slashes and capitalization for reliable Windows comparison
set "TARGET_NORM=%REPO_DIR:\=/%"
set "GITROOT_NORM=!GITROOT:\=/!"

echo Git root is: !GITROOT_NORM!
echo Expected:    !TARGET_NORM!

if /I not "!GITROOT_NORM!"=="!TARGET_NORM!" (
  echo ERROR: Git root is not the target folder.
  echo This prevents accidental commit of your whole Windows user folder.
  echo Aborting.
  pause
  exit /b 1
)

echo OK: Git root is exactly the target folder.
echo.

echo Configuring local anonymous identity...
git config --local user.name "Anonymous Researcher"
git config --local user.email "anonymousresearchrep@gmail.com"

echo.
echo Setting anonymous remote...
git remote remove origin 2>nul
git remote add origin %REMOTE_URL%

echo.
echo Current remote:
git remote -v

echo.
echo Checking for suspicious Office/archive files...
set "SUSPICIOUS_FOUND=0"
for /r %%f in (*.docx *.pdf *.zip *.rar) do (
  echo %%f
  set "SUSPICIOUS_FOUND=1"
)

if "!SUSPICIOUS_FOUND!"=="1" (
  echo.
  echo WARNING: Files above were found.
  echo If they are manuscript/submission/private files, stop now.
  echo Press Ctrl+C to abort, or any key to continue.
  pause
) else (
  echo No DOCX/PDF/ZIP/RAR files found.
)

echo.
echo Git status before commit:
git status --short

echo.
echo Adding files...
git add .

echo.
echo Creating commit...
git commit -m "Prepare anonymous reproducibility package v1.0.0"
if errorlevel 1 (
  echo.
  echo Commit may have failed because there is nothing new to commit.
  echo Continuing to push existing commit if any.
)

echo.
echo Final account check:
gh auth status

echo.
echo ========================================
echo ABOUT TO PUSH TO:
echo %REMOTE_URL%
echo.
echo It must be the anonymous repository.
echo Press Ctrl+C to abort, or any key to push.
echo ========================================
pause

git branch -M main
git push -u origin main

echo.
echo DONE.
pause
