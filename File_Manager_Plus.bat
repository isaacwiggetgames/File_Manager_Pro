@echo off
title File Manager Plus
color 0a
cls

:start
echo File Manager Plus
echo.
echo MENU
echo -------
echo 1 = Create Script File
echo 2 = Create Folder
echo 3 = Edit File
echo 4 = Delete File
echo 5 = Leave
echo.
echo 					         Made By Isaac Wigget  
echo.
echo.
set /p bang= Option: 

if "%bang%"=="1" goto create_script
if "%bang%"=="2" goto create_folder
if "%bang%"=="3" goto edit_file
if "%bang%"=="4" goto delete_file
if "%bang%"=="5" goto exit

cls
echo No Entry Found
pause >nul
goto start

:create_script
echo Select a script type:
echo 1 = Batch (.bat)
echo 2 = VBScript (.vbs)
echo 3 = PowerShell (.ps1)
echo 4 = Python (.py)
echo.
set /p script_type= Enter option: 

if "%script_type%"=="1" set extension=bat
if "%script_type%"=="2" set extension=vbs
if "%script_type%"=="3" set extension=ps1
if "%script_type%"=="4" set extension=py

if not defined extension (
    echo Invalid option.
    pause
    goto start
)

set /p filename= Enter file name (without extension): 
echo. > "%filename%.%extension%"
echo File "%filename%.%extension%" created.
pause
goto start

:create_folder
set /p foldername= Enter folder name: 
md "%foldername%"
echo Folder "%foldername%" created.
pause
goto start

:edit_file
set /p filename= Enter file name to edit (include extension): 
if exist "%filename%" (
    cls
    echo Current contents of "%filename%":
    echo ----------------------------------
    type "%filename%"
    echo.
    echo Enter new contents. Press Ctrl+Z then Enter to save.
    copy con "%filename%"
) else (
    echo File "%filename%" not found.
)
pause
goto start

:delete_file
set /p filename= Enter file name to delete (include extension): 
if exist "%filename%" (
    echo Are you sure you want to delete "%filename%"? (Y/N)
    set /p confirm=
    if /I "%confirm%"=="Y" (
        del "%filename%"
        echo File "%filename%" deleted.
    ) else (
        echo File deletion canceled.
    )
) else (
    echo File "%filename%" not found.
)
pause
goto start

:exit
cls
exit
