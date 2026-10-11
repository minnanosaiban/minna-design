@echo off
setlocal enabledelayedexpansion
rem Usage: sync.bat SITE_DIR   e.g. sync.bat C:\minnanosaiban\tomo
rem Copies only the CSS files that the site uses (listed in sites.txt) into SITE_DIR\docs\css\shared\.
rem shared\ is rebuilt every time: any other *.css in it is deleted. Never edit files there.
rem To add a site or change what it loads, edit sites.txt (format: folder_name=file1 file2 ...).
if "%~1"=="" (
  echo Usage: sync.bat SITE_DIR
  exit /b 1
)
set "P=%~1"
if "!P:~-1!"=="\" set "P=!P:~0,-1!"
if not exist "!P!\docs" (
  echo Not found: !P!\docs
  exit /b 1
)
for %%I in ("!P!") do set "SITE=%%~nxI"
set "LIST="
for /f "usebackq eol=# tokens=1,* delims==" %%a in ("%~dp0sites.txt") do (
  if /i "%%a"=="!SITE!" set "LIST=%%b"
)
if "!LIST!"=="" (
  echo "!SITE!" is not listed in %~dp0sites.txt. Add a line: !SITE!=tokens base ...
  exit /b 1
)
for %%f in (!LIST!) do (
  if not exist "%~dp0css\%%f.css" (
    echo Missing source: %~dp0css\%%f.css
    exit /b 1
  )
)
set "DEST=!P!\docs\css\shared"
if not exist "!DEST!" mkdir "!DEST!"
del /q "!DEST!\*.css" >nul 2>&1
for %%f in (!LIST!) do (
  copy /y "%~dp0css\%%f.css" "!DEST!\" >nul
  if errorlevel 1 (
    echo Copy failed: %%f.css
    exit /b 1
  )
)
echo Synced to !DEST!: !LIST!
