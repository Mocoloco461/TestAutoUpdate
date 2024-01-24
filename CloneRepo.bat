@echo off
:: Check if Git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed or not in the system PATH. Please install Git and try again.
    pause
    exit /b 1
)

:: Step 1: Delete existing TestAutoUpdate folder if it exists
if exist TestAutoUpdate (
    echo Found existing TestAutoUpdate folder. Deleting...
    rmdir /s /q TestAutoUpdate
)

:: Step 2: Clone the GitHub repository
echo Attempting to clone https://github.com/Mocoloco461/TestAutoUpdate/...
git clone https://github.com/Mocoloco461/TestAutoUpdate/
if %errorlevel% neq 0 (
    echo Failed to clone the repository. Please check your internet connection or permissions and try again.
    pause
    exit /b 1
)

:: Step 3: Navigate to TestAutoUpdate and use PyInstaller to create an executable from main.py
cd TestAutoUpdate
if exist main.py (
    echo Creating executable from main.py...
    pyinstaller --onefile main.py
) else (
    echo main.py does not exist in the cloned repository.
    pause
    exit /b 1
)

:: Assuming the executable is created in the dist folder
cd dist

:: Step 4: Create a shortcut to the executable on the desktop
echo Creating shortcut to the executable on the desktop...
(
echo Set oWS = WScript.CreateObject("WScript.Shell") 
echo sLinkFile = "%USERPROFILE%\Desktop\Human Map.lnk" 
echo Set oLink = oWS.CreateShortcut(sLinkFile)
echo oLink.TargetPath = "%CD%\main.exe" 
echo oLink.Save
) > CreateShortcut.vbs

:: Execute the VBS script to create the shortcut
cscript /nologo CreateShortcut.vbs
del CreateShortcut.vbs

cd ../..

echo Repository cloned and application installed successfully.
pause

