@echo off
SET "folderPath=%~dp0TestAutoUpdate"

:: Check if the TestAutoUpdate folder exists
IF EXIST "%folderPath%" (
    :: Change to the directory
    cd /d "%folderPath%"
    
    :: Use PyInstaller to make main.py an executable
    pyinstaller --onefile main.py
    
    :: Assuming the executable is created in the 'dist' folder
    SET "exePath=%folderPath%\dist\main.exe"
    
    :: Check if the executable was created
    IF EXIST "%exePath%" (
        :: Create shortcut on Desktop
        powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\Human Map.lnk');$s.TargetPath='%exePath%';$s.Save()"
        echo Shortcut "Human Map" created on Desktop.
    ) ELSE (
        echo Failed to create executable. Check PyInstaller output for errors.
    )
) ELSE (
    echo Folder "TestAutoUpdate" not found.
)
pause

