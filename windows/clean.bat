@echo off
setlocal enabledelayedexpansion

:: Request admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting admin privileges...
    powershell Start-Process '%0' -Verb RunAs
    exit
)

:: Clean Recycle Bin
del /f /s /q %systemdrive%\$Recycle.Bin > nul 2>&1
rd /s /q %systemdrive%\$Recycle.Bin > nul 2>&1

echo Recycle Bin cleaned.

:: Clean Temp Files
del /f /s /q %temp%\*.* > nul 2>&1
rd /s /q %temp% > nul 2>&1
md %temp%

echo Temp files cleaned.

:: Clean Windows Temp
del /f /s /q C:\Windows\Temp\*.* > nul 2>&1
rd /s /q C:\Windows\Temp > nul 2>&1
md C:\Windows\Temp

echo Windows temp files cleaned.

:: Clean Prefetch (optional, speeds up application startup but can be cleared)
del /f /s /q C:\Windows\Prefetch\*.* > nul 2>&1
echo Prefetch cleaned.

:: Clean User Cache (Chrome, Edge, etc.)
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*" > nul 2>&1
echo Browser cache cleaned.

:: Disk Cleanup (silent mode)
cleanmgr /sagerun:1

echo Cleanup complete.
