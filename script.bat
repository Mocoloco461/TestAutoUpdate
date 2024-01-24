@echo off
REM Step 0: Define script's current and parent directory paths
set "script_path=%~f0"
set "current_directory=%~dp0"
set "parent_directory=%~dp0.."

REM Step 1: Rename this script by appending a "1" to its name
set "script_name=%~nx0"
set "new_name=%script_name%1"
move "%script_path%" "%new_name%"

REM Moving the script to the parent directory temporarily
move "%new_name%" "%parent_directory%"
cd /d "%parent_directory%"

REM Step 2: Delete the original folder containing the script
REM WARNING: This will delete all contents of the script's original directory
rmdir /s /q "%current_directory%"

REM Step 3: Clone the GitHub repository into the current location (which is the parent of the original script's folder)
REM Note: Git must be installed and accessible from CMD
git clone https://github.com/Mocoloco461/TestAutoUpdate.git

REM Step 4: Delete this script file
del /f /q "%new_name%"

