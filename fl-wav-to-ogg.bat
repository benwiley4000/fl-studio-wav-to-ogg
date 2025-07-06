@echo off
setlocal enabledelayedexpansion

:: Get the full path to the folder containing the batch script
set "BASE_DIR=%~dp0"

:: Remove trailing backslash if present
if "%BASE_DIR:~-1%"=="\" set "BASE_DIR=%BASE_DIR:~0,-1%"

:: Define input and output folders
set "WAV_FOLDER=%BASE_DIR%\WAV"
set "OGG_FOLDER=%BASE_DIR%\OGG"

:: Create destination folder if it doesn't exist
if not exist "%OGG_FOLDER%" (
    mkdir "%OGG_FOLDER%"
)

:: Loop through all .wav files
for %%F in ("%WAV_FOLDER%\*.wav") do (
    set "SRC=%%~fF"
    set "FILENAME=%%~nF"
    set "DEST=%OGG_FOLDER%\%%~nF.ogg"

    echo Processing: %%~nxF

    powershell -NoProfile -Command ^
    "$in = [System.IO.File]::OpenRead('!SRC!'); $in.Position = 54; $out = [System.IO.File]::Create('!DEST!'); $in.CopyTo($out); $in.Close(); $out.Close();"
)

echo Done.
pause