## Build PyWin32 on Windows ARM64

PyWin32 is a critical piece in the Windows Python ecosystem, required for cloudbase-init, nova, etc.

PyWin32 sources: https://github.com/mhammond/pywin32.

### Requirements:

  * Visual Studio 2017 or 2019.
    See [vsconfig.txt](../../vsconfig.txt) for Visual Studio installation configuration.
  * Windows 10 ADK
  * Python 3.8.x or higher

### Build for ARM64

To build it on ARM64, these patches are required:

  * https://github.com/ader1990/pywin32/commit/8d02293df764e69fdafd225316922a9a806e25b7
  * https://github.com/mhammond/pywin32/pull/1617/commits/087a48d8919d66337aa924cad6b3c9ce9cfbad9c
  * https://github.com/mhammond/pywin32/pull/1617/commits/7890850f1808431f3f1b876cf9faa3c7ab302e88

Grab a cup of coffee, as it takes a while (around 30 minutes).

Example batch script (using VS2019 and Windows 10 SDK 10.0.17763.0):

```cmd
set VCVARSALL="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
call %VCVARSALL% x86_arm64 10.0.17763.0 & set

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
```

### Notes

The first patch disables pythonwin_extensions build. More investigation is required to build them.