@echo off

SET PYTHON_DIR=C:\Users\Administrator\test\py
SET PATH=%PYTHON_DIR%;%PYTHON_DIR%\Scripts;%PATH%

set VCVARSALL="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
set CL_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.27.29110\bin\HostX86\ARM64\cl.exe"
set MC_PATH="C:\Program Files (x86)\Windows Kits\10\bin\10.0.17763.0\arm64\mc.exe"

call %VCVARSALL% amd64_arm64 10.0.17763.0 & set

date /t

python --version
IF %ERRORLEVEL% NEQ 0 EXIT 1

date /t
echo "Installing setuptools, pip and wheel"
del /f /s /q setuptools 1>nul 2>nul
rmdir /s /q setuptools 1>nul 2>nul
git clone https://github.com/ader1990/setuptools 1>nul
IF %ERRORLEVEL% NEQ 0 EXIT 1
pushd setuptools
    git checkout am_64
    echo "Installing setuptools"
    python.exe bootstrap.py 1>nul 2>nul
    IF %ERRORLEVEL% NEQ 0 EXIT 1

    %CL_PATH% /D "GUI=0" /D "WIN32_LEAN_AND_MEAN" /D _ARM64_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE launcher.c /O2 /link /MACHINE:ARM64 /SUBSYSTEM:CONSOLE /out:setuptools/cli-arm64.exe
    IF %ERRORLEVEL% NEQ 0 EXIT 1

    python.exe setup.py install 1>nul
    IF %ERRORLEVEL% NEQ 0 EXIT 1
popd

echo "Installing pip"
python.exe -m easy_install https://github.com/pypa/pip/archive/20.0.2.tar.gz 1>nul 2>nul
IF %ERRORLEVEL% NEQ 0 EXIT 1

echo "Installing wheel"
python.exe -m easy_install https://github.com/ader1990/pip/archive/20.3.dev1.win_arm64.tar.gz 1>nul 2>nul
IF %ERRORLEVEL% NEQ 0 EXIT 1

date /t
echo "Installing pywin32"
del /f /s /q pywin32 1>nul 2>nul
rmdir /s /q pywin32 1>nul 2>nul
git clone https://github.com/ader1990/pywin32 1>nul
IF %ERRORLEVEL% NEQ 0 EXIT 1
pushd pywin32
    git checkout win_arm64
    IF %ERRORLEVEL% NEQ 0 EXIT 1
    pushd "win32\src"
        %MC_PATH% -A PythonServiceMessages.mc -h .
    popd
    pushd "isapi\src"
        %MC_PATH% -A pyISAPI_messages.mc -h .
    popd
    mkdir "build\temp.win-arm64-3.9\Release\scintilla" 1>nul 2>nul
    echo '' > "build\temp.win-arm64-3.9\Release\scintilla\scintilla.dll"
    mkdir "build\temp.win-arm64-3.8\Release\scintilla" 1>nul 2>nul
    echo '' > "build\temp.win-arm64-3.8\Release\scintilla\scintilla.dll"
    python.exe setup.py install --skip-verstamp
    IF %ERRORLEVEL% NEQ 0 EXIT 1
popd

date /t
echo "Installing cloudbase-init"
del /f /s /q cloudbase-init 1>nul 2>nul
rmdir /s /q cloudbase-init 1>nul 2>nul
git clone https://github.com/cloudbase/cloudbase-init 1>nul
IF %ERRORLEVEL% NEQ 0 EXIT 1
pushd cloudbase-init
    echo "Installing cloudbase-init requirements"
    python.exe -m pip install -r requirements.txt 1>nul
    IF %ERRORLEVEL% NEQ 0 EXIT 1
    python.exe -m pip install .  1>nul
    python.exe setup.py install  1>nul
    IF %ERRORLEVEL% NEQ 0 EXIT 1
popd

echo "Installation completed"
