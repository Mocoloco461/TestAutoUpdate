@echo off
REM Ensure the script is run from the application's directory or set the directory manually
cd /d "%~dp0"

REM Define the application directory and the repository URL
set "app_directory=."
set "repository_url=https://github.com/Mocoloco461/TestAutoUpdate.git"

REM Step 1: Delete the application's current version
REM WARNING: This deletes all files in the application directory!
for /d %%x in (%app_directory%\*) do rmdir /s /q "%%x"
del /q %app_directory%\*.*

REM Step 2: Clone the latest version of the application
git clone %repository_url% %app_directory%

echo Update completed.

