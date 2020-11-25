## Build OpenSSL on Windows

OpenSSL is a critical piece in the Windows ecosystem, required for Python, OpenVswitch, etc.

OpenSSL sources: https://github.com/openssl/openssl.

### Requirements:

  * Visual Studio 2017 or 2019.<br/>
    See [vsconfig.txt](../../vsconfig.txt) for Visual Studio installation configuration.
  * Windows 10 ADK
  * Perl (Strawberry Perl for Windows)<br/>
    Download link: http://strawberryperl.com/download/5.20.3.3/strawberry-perl-5.20.3.3-32bit-PDL.zip
  * nasm<br/>
    You can get a binary installed from the msys64 binary folder (C:\msys64\usr\bin).<br/>
    Use a 32bit one when building on an ARM64 machine (C:\msys32\usr\bin).<br/>
    Installation: pacman -Sy nasm

### Build for X64
Make sure perl.exe and nasm.exe is in your path.
Grab a cup of coffee, as it takes a while (around 30 minutes).

Example batch script (using VS2019 and Windows 10 SDK 10.0.18362.0):

```cmd
set VCVARSALL="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
call %VCVARSALL% x64 10.0.18362.0 & set
perl Configure VC-WIN64A
nmake
```

### Build for ARM64

For OpenSSL 1.1.0 or 1.1.1, this patch needs to be applied:

https://github.com/openssl/openssl/commit/abd054036cdf70661aa2097033f036f93c6cdb62.patch

```cmd
set VCVARSALL="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
call %VCVARSALL% x86_arm64 10.0.17763.0 & set
perl Configure VC-WIN64-ARM
nmake
```

### Fast build

Use jom to speed up the build.
You can download jom binary from: http://download.qt.io/official_releases/jom/.

You need to add the "/FS" flag to Perl Configure. Use as many thread as you prefer (62 is a good  trade-off).

```cmd
perl Configure VC-WIN64A /FS
REM perl Configure VC-WIN64-ARM /FS
jom -j 62
```
