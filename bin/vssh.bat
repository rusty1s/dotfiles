@echo off
setlocal

if "%VAGRANT_DIR%"=="" (
  echo Please set VAGRANT_DIR environment variable and run again.
  exit /B 0
)

cd "%VAGRANT_DIR%"
vagrant ssh
