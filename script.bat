@echo off
setlocal enabledelayedexpansion

:: Step 0: Get the current script's path and parent directory
set "script=%~f0"
set "currentDir=%~dp0"
set "parentDir=%currentDir%.."

:: Step 1: Rename this script by appending a "1" to its name
set "newName=%~n0_1%~x0"
copy "%script%" "%parentDir%\%newName%"
cd /d "%parentDir%"

:: Step 2 & 3 are combined due to the limitation of deleting the script's original directory while it is running
:: The script moves itself up one directory, deletes the target directory, and then clones the git repository
:: WARNING: The next command will delete the script's original directory entirely
rd /s /q "%currentDir%"

:: Step 3: Clone the GitHub repository (Git must be installed and in the system's PATH)
git clone https://github.com/Mocoloco461/TestAutoUpdate.git

:: Step 4: Delete this script file after execution
:: Using ping as a delay to allow the batch file to finish execution before deletion
ping localhost -n 3 > nul
del "%parentDir%\%newName%"

endlocal

