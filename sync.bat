@echo off
rem Usage: sync.bat SITE_DIR   e.g. sync.bat C:\minnanosaiban\tomo
rem Copies css\*.css into SITE_DIR\docs\css\shared\ (overwrite). Do not edit the copies in the site repos.
if "%~1"=="" (
  echo Usage: sync.bat SITE_DIR
  exit /b 1
)
if not exist "%~1\docs" (
  echo Not found: %~1\docs
  exit /b 1
)
if not exist "%~1\docs\css\shared" mkdir "%~1\docs\css\shared"
copy /y "%~dp0css\*.css" "%~1\docs\css\shared\" >nul
if errorlevel 1 (
  echo Copy failed.
  exit /b 1
)
echo Synced to %~1\docs\css\shared\
