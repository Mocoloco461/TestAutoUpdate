@echo off
setlocal enabledelayedexpansion

:: Ensure git is available
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git is not installed or not in PATH.
    exit /b 1
)

:: Create a temporary script to handle the operations
set "tempScript=%temp%\tempOperation_%random%.bat"

:: Step 2: Write operations to the temporary script
(
echo @echo off
echo cd /d "%~dp0"
echo echo Deleting all files except the batch scripts...
echo for /f "delims=" %%i in ('dir /b /a-d ^| findstr /v /i "bat$"') do (del "%%i")
echo echo Deleting all directories...
echo for /d %%i in (*) do (rd /s /q "%%i")
echo echo Cloning the repository...
echo git clone https://github.com/Mocoloco461/TestAutoUpdate/ .
echo echo Deleting the original script...
echo del "%~f0" /q
echo echo Deleting self...
echo del "%~f0" /q
) > "%tempScript%"

:: Execute the temporary script
start /b "" cmd /c "%tempScript%"
exit

