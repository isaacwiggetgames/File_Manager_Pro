@echo off
title File Manager Plus (Version 1.2)
color 0a
cls

:start
echo File Manager Plus
echo.
echo MENU
echo -------
echo 0 = Fun matrix Thing
echo 1 = Create Script File
echo 2 = Create Folder
echo 3 = Edit File
echo 4 = Delete File
echo 5 = Settings
echo 6 = Leave
echo.
echo 					         Made By Isaac Wigget  
echo.
echo.
set /p bang= Option: 
if /I "%bang%"=="Admin" goto admin_menu
if /I "%bang%"=="clear" cls & goto start
if "%bang%"=="0" goto matrix
if "%bang%"=="1" goto create_script
if "%bang%"=="2" goto create_folder
if "%bang%"=="3" goto edit_file
if "%bang%"=="4" goto delete_file
if "%bang%"=="5" goto settings
if "%bang%"=="6" goto exit

cls
echo No Entry Found
pause >nul
goto start

:color
echo Choose a color code (Background + Foreground):
echo Example: 0A for Black background and Green text.
set /p colorCode=Enter color:
color %colorCode%
echo Color changed!
pause
goto start

:matrix
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%raindom%%raindom%%raindom%%raindom%%raindom%%random%%random%%random%%random%%random%%random%%random%%random%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%%raindom%
goto matrix
:create_script
echo Select a script type:
echo 1 = Batch (.bat)
echo 2 = VBScript (.vbs)
echo 3 = PowerShell (.ps1)
echo 4 = Python (.py)
echo 5 = Javascript (.js)
echo 6 = Text File (.txt)
echo.
set /p script_type= Enter option: 

if "%script_type%"=="1" set extension=bat
if "%script_type%"=="2" set extension=vbs
if "%script_type%"=="3" set extension=ps1
if "%script_type%"=="4" set extension=py
if "%script_type%"=="5" set extension=js
if "%script_type%"=="6" set extension=txt

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

:admin_menu
cls
echo ============================
echo      ADMIN MENU ACTIVATED
echo ============================
echo 1 = View System Info
echo 2 = List Files in Directory
echo 3 = Create a Secret Admin File
echo 4 = Return to Main Menu
echo.
set /p admin_option= Select an option: 

if "%admin_option%"=="1" goto sys_info
if "%admin_option%"=="2" goto list_files
if "%admin_option%"=="3" goto create_secret
if "%admin_option%"=="4" goto start

echo Invalid option.
pause
goto admin_menu

:sys_info
cls
systeminfo | more
pause
goto admin_menu

:list_files
cls
dir /b
pause
goto admin_menu

:create_secret
cls
echo Admin Access Granted > secret_admin.txt
echo Secret admin file created.
pause
goto admin_menu

:settings
cls
echo ============================
echo        SETTINGS MENU
echo ============================
echo 1 = Change Title
echo 2 = Change Text Color
echo 3 = Suggest Feature
echo 4 = Version
echo q = Close
echo.
set /p setting_option= Select an option: 

if "%setting_option%"=="1" goto change_title
if "%setting_option%"=="2" goto color
if "%setting_option%"=="3" goto suggest_feature
if "%setting_option%"=="4" goto version
if "%setting_option%"=="q" cls & goto start

echo Invalid option.
pause
goto settings

:change_title
cls
set /p new_title= Enter new title: 
title %new_title%
echo Title changed to "%new_title%"
pause
goto settings

:suggest_feature
cls
echo Opening suggestion form...
start "" "https://docs.google.com/forms/d/e/1FAIpQLSe16iCIOMsc6n3BtK5cwUvlO1jvo_cbtuGMbUElA-rnJa5TrQ/viewform?usp=dialog"
pause
goto settings

:version
set version=1.2
echo Version is currently %version%
pause >nul
goto start
:exit
cls
exit
