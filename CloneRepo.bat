@echo off
:: Check if Git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed or not in the system PATH. Please install Git and try again.
    pause
    exit /b 1
)

:: Clone the GitHub repository
echo Attempting to clone https://github.com/Mocoloco461/TestAutoUpdate/...
git clone https://github.com/Mocoloco461/TestAutoUpdate/
if %errorlevel% neq 0 (
    echo Failed to clone the repository. Please check your internet connection or permissions and try again.
    pause
    exit /b 1
)

echo Repository cloned successfully.
pause

