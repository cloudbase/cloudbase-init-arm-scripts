## Requirements to build Cloudbase-Init for Windows ARM64:

1. Python for WinARM64 folder located at C:\Users\Administrator\test\py. You need to build a v3.8 or v3.9.0rc2 (latest 3.9 is not compatible with oslo). You can use the GitHub workflows from here https://github.com/ader1990/CPython-Windows-ARM64 to build Python. Before building Python, you need to cherry pick this commit on top of the Python code: https://github.com/cloudbase/cpython/pull/2/commits/039d58efcbbb00c3f66fcbd81e3cbf2db643fc8c. A working Python can be downloaded from https://github.com/ader1990/CPython-Windows-ARM64/releases/tag/v3.8.5-win-arm64
2. Visual Studio 2019 installed by importing the settings from vsconfig.txt
3. From CMD.exe (ARM64 version), run install-cloudbase-init-on-arm64.bat
4. Cloudbase-init binary should be created at C:\Users\Administrator\test\py\Scripts\cloudbase-init.exe
