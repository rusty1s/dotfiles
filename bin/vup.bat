@echo off
setlocal

if "%VAGRANT_CONFIG%"=="" (
  echo Please set VAGRANT_CONFIG environment variable and run again.
  exit /B 0
)

if "%VAGRANT_DIR%"=="" (
  echo Please set VAGRANT_DIR environment variable and run again.
  exit /B 0
)

if not exist "%VAGRANT_DIR%" mkdir "%VAGRANT_DIR%"
cd "%VAGRANT_DIR%"

set EXISTS=1
if exist "%VAGRANT_DIR%\Vagrantfile" set EXISTS=0

if "%EXISTS%"=="0" (
  echo It seems that a Vagrantfile already exists in this directory.
  choice /C NY /M "Do you want a fresh install"

  if ERRORLEVEL 2 (
    vagrant destroy -f

    rmdir /Q /S "%VAGRANT_DIR%"
    mkdir "%VAGRANT_DIR%"
  )
)

set EXISTS=1
if exist "%VAGRANT_DIR%\Vagrantfile" set EXISTS=0

copy /Y "%VAGRANT_CONFIG%\Vagrantfile" "%VAGRANT_DIR%\Vagrantfile"

if "%EXISTS%"=="0" (
  echo Start provision Vagrantfile...

  vagrant provision
) else (
  echo Install fresh varant environment...

  vagrant box update
  vagrant plugin install vagrant-proxyconf
  vagrant up
)
