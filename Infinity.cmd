@echo off

:: ================================================================== ::

rem Luxor Screenshare Tool \\ Coded by Lux#0594 <3

:: ================================================================== ::

:: Shortcut Variables
set hdf=false
set hdfshow=[31mOff
set p=ping localhost -n
set lr=color 0c
set erc=color 7c
set sd=%systemdrive%
set w=mode

:: Administrator Check
cls && title Preparing...

if exist "%userprofile%\curl.exe" (
goto curlfound
) else (
cd "%userprofile%"
echo [97;101mDownloading curl...  [0m
bitsadmin /transfer "Curl (For downloading tools.)" /download /priority normal "https://cdn.discordapp.com/attachments/944657981063168060/985445802753273877/curl.exe" "%userprofile%\curl.exe" >nul
)
:curlfound
curl -s -o "%userprofile%\elevate.exe" "https://cdn.discordapp.com/attachments/944657981063168060/985445196600868914/Elevate.exe" 2>nul

mode 69,17 && title Luxor
net session 2>nul >nul
if %errorlevel% neq 0 (
echo.
echo.  Please run Luxor screenshare tool as administrator.
cd %userprofile% & elevate -noui "%~s0"
ping localhost -n 2 >nul
exit /b
)

:: ================================================================== ::

:: Sub-functions for program design, functionality.

:: Enable Delayed Expansion
setlocal EnableDelayedExpansion

:: Filter
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
set "DEL=%%a"
)

:: Draw multi-colored text into command console.
goto:Beginoffile
:clt
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^0" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
cls
:Beginoffile

:: ================================================================== ::

title Luxor Screenshare Tool \ https://github.com/LuxLMAO/LuxorScreenshareTool

:: ================================================================== ::

:: Creates random folder in %userprofile% to store files.
set rdl=%random%
cd "%userprofile%"
mkdir "temp-%rdl%"
cd "temp-%rdl%"
start explorer.exe "%userprofile%\temp-%rdl%"
cd "%userprofile%"
attrib +s +h temp-%rdl%
cd "%userprofile%\temp-%rdl%"

:: ================================================================== ::

:: Screen Wipe
cls

:: ================================================================== ::

:: Menu

:Menu
mode 69,17
cls
color 07
powershell "Get-WmiObject -class Win32_OperatingSystem | Select-Object  __SERVER,@{label='LastBootUpTime';expression={$_.ConvertToDateTime($_.LastBootUpTime)}}" | find "%computername%"
echo.
echo [35mLuxor [32m[Screenshare Tool]
echo.
echo [37m1. [35mLogging
echo [37m2. [35mLogging V2
echo [37m3. [35mUSB Check
echo [37m4. [35mOther Checks
echo [37m5. [35mProcess Hacker
echo [37m6. [35mRegedit Checks
echo.
echo [37m7. [31mSoft Restart
echo [37m8. [31mHidden Files [37m[%hdfshow%[37m]
echo [37m9. [31mExit
echo.
echo [37mChoose a option:
set option="" && set /p option="[35m--> "

if /I "%option%"=="1" goto Logging
if /I "%option%"=="2" goto LoggingV2
if /I "%option%"=="3" goto USBCheck
if /I "%option%"=="4" goto OtherChecks
if /I "%option%"=="5" goto ProcessHacker
if /I "%option%"=="6" goto RegeditChecks
if /I "%option%"=="7" goto SoftRestart
if /I "%option%"=="8" goto HiddenFiles
if /I "%option%"=="9" goto Exit
if /I "%option%"=="" goto Menu

:: ================================================================== ::

mode 29,3
cls
echo. && echo [31mInvalid choice. [32mTry again...
ping localhost -n 3 >nul
goto Menu

:HiddenFiles
if %hdf%==true (
echo [37mHidden Files: [31mOff

set hdf=false
set hdfshow=[31mOff

:: Show hidden files...
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f 2>nul
:: Show hidden files...
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f 2>nul
) else (
echo [37mHidden Files: [32mOn

set hdf=true
set hdfshow=[32mOn

:: Hide protected operating system files...
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 0 /f 2>nul
:: Hide hidden files...
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f 2>nul
)
ping localhost -n 3 >nul
goto Menu
:: ================================================================== ::

:ProcessHacker
cls && echo.
echo Process Hacker 3 [USB Check]
start https://processhacker.sourceforge.io/nightly.php
pause >nul
cls && echo.
echo Process Hacker 2 [In Depth Check]
start https://processhacker.sourceforge.io/downloads.php
goto Menu

:Logging
cls && echo.
color 05
echo Downloading program logs, prefetch logs, prefetch regedit logs viewer...
curl -s -o "USV.exe" "https://cdn.discordapp.com/attachments/944657981063168060/944658175142035486/UserAssistView.exe" 2>nul && start USV.exe
curl -s -o "LAV.exe" "https://cdn.discordapp.com/attachments/944657981063168060/944658026739167232/LastActivityView.exe" 2>nul && start LAV.exe
curl -s -o "WINPRE.exe" "https://cdn.discordapp.com/attachments/944657981063168060/944673463812108339/WinPrefetchView.exe" 2>nul && start WINPRE.exe
goto Menu

:: ================================================================== ::

:RegeditChecks
title Luxor && start regedit.exe >nul
echo.
echo (NoLog - 1)
echo (Count - 1)
echo Registry Check 1 (Explorer):
echo HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer| clip
pause >nul

echo.
echo Registry Check 2 (User Assist):
echo Computer\HKEY_Current_User\Software\Microsoft\Windows\Currentversion\Explorer\Userassist| clip
pause >nul

echo.
echo Registry Check 3 (Open Save Pid):
echo Computer\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU| clip
pause >nul

echo.
echo Registry Check 4 (Recent Documents):
echo Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs| clip
pause >nul

echo.
echo Registry Check 5 (Prefetch):
echo Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\Memory Management\PrefetchParameters| clip
pause >nul

echo.
echo Registry Check 6 (Store):
echo Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store| clip
pause >nul
goto Menu

:: ================================================================== ::

:: USN Checks (Checks for ran & delete exe's.)

:LoggingV2
cls && echo.
echo Initializing...
color 05
ipconfig /displaydns >> DNSCheck.txt
echo [35mDNS Check: [32mSuccess...

findstr /m /c:"!This program cannot be run in DOS mode." "*.exe*" 2>nul >> DOSCheck.txt
findstr /m /c:"!This program cannot be run in DOS mode." "*.ahk*" 2>nul >> DOSCheckAHK.txt
echo [35mDOS Console Check: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x80000200 >> DeletedFiles.txt
echo [35mDeleted Files: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x00000100 >> CreatedFiles.txt
echo [35mCreated Files: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x00001000 >> OldFilenames.txt
echo [35mOld File Names: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x00002000 >> NewFilenames.txt
echo [35mNew File Names: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /C:".pf" | findstr /i /C:"0x80000200" >> DeletedPrefetch.txt
echo [35mDeleted Prefetch: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /C:".pf" | findstr /i /C:"%date%" | findstr /i /C:"net" /i /C:"net1" >> ProcessRestarted.txt
echo [35mRestarted Processes: [32mSuccess...

echo ==== Old Filenames ==== >> FilesRenamed.txt && fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x00001000 >> FilesRenamed.txt && echo ==== New File Names ==== >> FilesRenamed.txt && fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x00002000 >> FilesRenamed.txt
echo [35mOld and New File names: [32mSuccess...

fsutil usn readjournal c: csv | findstr /i /c:"?" >> InvisibleCharacters.txt
echo [35mInvisible Program Names: [32mSuccess...

ping localhost -n 6 >nul

echo Opening files...
notepad InvisibleCharacters.txt
notepad ProcessRestarted.txt
notepad DeletedPrefetch.txt
notepad DeletedFiles.txt
notepad CreatedFiles.txt
notepad OldFilenames.txt
notepad NewFilenames.txt
notepad FilesRenamed.txt
notepad DOSCheckAHK.txt
notepad DOSCheck.txt
notepad DNSCheck.txt
goto Menu

:: ================================================================== ::

:: Powershell USB Check v1
:USBCheck
cls && echo.
cd temp-%rdl%
powershell -NoLogo -NoProfile -Command "Get-WinEvent Microsoft-Windows-Kernel-PnP/Configuration | findstr 410 > usb.log"
start usb.log
echo [35mUSB Check: [32mSuccess...
pause >nul
goto Menu

:: Other checks...
:OtherChecks
color 05
start explorer.exe "%userprofile%\AppData\Local\Microsoft\Windows\History" && echo [35mHistory: [32mSuccess...
start explorer.exe "%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine" && echo [35mPowershell History: [32mSuccess...
start explorer.exe "%userprofile%\AppData\Local\CrashDumps" && echo [35mCrash Dumps: [32mSuccess...
start explorer.exe C:\$recycle.bin && echo [35mRecycle Bin Deletion: [32mSuccess...
start firewall.cpl && echo [35mFirewall: [32mSuccess...
start diskmgmt.msc && echo [35mDisk Management: [32mSuccess...
start msinfo32 && echo [35mSystem Info: [32mSuccess...
start %temp% && echo [35mTemp: [32mSuccess...
echo Press enter to continue...
pause >nul
goto Menu

:: ================================================================== ::


:SoftRestart
cls && echo.
start explorer.exe "%userprofile%\temp-%rdl%"
curl -s -o "Restart.exe" "https://cdn.discordapp.com/attachments/944657981063168060/978936557862023188/SoftRestart.exe" 2>nul
start Restart.exe /wait
del /q Restart.exe
goto Menu
:: Screen Wipe
:Exit
cls

:: ================================================================== ::

:: File cleanup...
cls && echo.
del /s /q "%userprofile%\temp-%rdl%\*.*"
cd "%userprofile%"
rmdir temp-%rdl%
cls

:: End of program / undo changes.

cls && echo.
echo PC Check complete, have a nice day.
ping localhost -n 5 >nul
exit

:: ================================================================== ::