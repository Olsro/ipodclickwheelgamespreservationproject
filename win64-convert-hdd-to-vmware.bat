@echo off
REM ==============================================================================
REM   convert_qcow2_to_vmdk.bat
REM   - Checks admin privileges
REM   - Handles path > 260 characters using a symbolic link
REM   - Converts QCOW2 to VMDK using qemu-img
REM   - Cleans up temporary link
REM ==============================================================================

REM 1) Change directory to the script location
cd /d %~dp0

REM 2) Check if running as admin
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"
if '%ERRORLEVEL%' NEQ '0' (
    echo WARNING: This script requires administrative privileges to run properly.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

REM 3) Display the purpose of the script
echo Let's convert the Qemu Virtual HDD (.qcow2) into a VMWare Virtual HDD (.vmdk)

REM 4) Set source and destination paths/filenames
REM Adjust these as needed:
set "TARGET=A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2"
set "PATH=%~dp0iPod.Clickwheel.Games.Preservation.Project.utm/iPod Clickwheel Games Preservation Project.utm/Data"
set "INPUT_FILE=%PATH%/%TARGET%"
set "OUTPUT_FILE=win64-vmware/iPod Clickwheel Games Preservation Project.vmdk"

REM 5) Check for path length > 260 chars; create symlink if needed
setlocal enabledelayedexpansion
set "PATH_LENGTH_STR=%INPUT_FILE%"
set "PATH_LENGTH=!PATH_LENGTH_STR:~0,260!"
if not "!PATH_LENGTH!"=="%INPUT_FILE%" (
    echo Input file path exceeds the maximum allowed length of 260 characters. Creating a symbolic link.

    set "MAXCHAR=1"
    mklink /D "C:\ClickWheelGames" "%PATH%"
    
    REM Update the INPUT_FILE path to the new location
    set "INPUT_FILE=C:\ClickWheelGames\%TARGET%"
) else (
    echo Please move the file manually to a shorter path and edit this script accordingly.
    pause
    exit /b 1
)

REM 6) Check if the input file exists
echo Checking if input file exists...
if exist "%INPUT_FILE%" (
    echo Using path: %INPUT_FILE%
    echo ==============================================================================
    echo In progress... don't close this console window until it's finished.
    echo This step can take a while...
    echo.

    REM 7) Convert the .qcow2 file to .vmdk using qemu-img
    "win64-qemuimg\qemu-img.exe" convert -p -f qcow2 -O vmdk "%INPUT_FILE%" "%OUTPUT_FILE%"

    REM 8) Check if conversion was successful
    if !ERRORLEVEL! EQU 0 (
        if "%MAXCHAR%"=="1" (
            rmdir "C:\ClickWheelGames"
            echo Temporary link (C:\ClickWheelGames) removed.
        )
        echo Conversion successful!
    ) else (
        if "%MAXCHAR%"=="1" (
            rmdir "C:\ClickWheelGames"
            echo Temporary link (C:\ClickWheelGames) removed.
        )
        echo ERROR: Conversion failed. Please check your input file or paths.
    )
) else (
    if "%MAXCHAR%"=="1" (
        rmdir "C:\ClickWheelGames"
        echo Temporary link (C:\ClickWheelGames) removed.
    )
    echo ERROR: File not found - %INPUT_FILE%
)

REM 9) Pause at the end to keep the console window open
pause
