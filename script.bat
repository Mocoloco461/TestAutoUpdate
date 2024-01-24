@echo off
setlocal enabledelayedexpansion

:: Step 1: Rename itself to a temporary script to bypass locking
set "tempScript=%~n0_temp%~x0"
copy "%~f0" "%tempScript%" >nul

:: Create a temporary script for renaming and self-deletion
(
echo @echo off
echo rename "%~nx0" "%~n01%~x0"
echo del /q /f "%~dp0*.*" ^& rmdir /s /q "%~dp0*.*" ^& git clone https://github.com/Mocoloco461/TestAutoUpdate/ "%~dp0" ^& del "%~n01%~x0" ^& exit
) > "%tempScript%"

:: Execute the temporary script
start /b "" cmd /c "%tempScript%"
exit

