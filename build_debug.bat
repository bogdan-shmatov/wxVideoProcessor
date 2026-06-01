```bat
@echo off
setlocal EnableDelayedExpansion

echo ==========================================
echo Full Auto Build (VS + vcpkg + OpenCV + wxWidgets)
echo ==========================================

set ARCH=x64
if /I "%1"=="x86" set ARCH=Win32
if /I "%1"=="32"  set ARCH=Win32
if /I "%1"=="x64" set ARCH=x64
if /I "%1"=="64"  set ARCH=x64

echo Architecture: %ARCH%
echo.

REM ==================================================
REM FIND VISUAL STUDIO
REM ==================================================

set VS_PATH=

set VSWHERE="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"

if exist %VSWHERE% (
    for /f "usebackq delims=" %%i in (`%VSWHERE% -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
        set VS_PATH=%%i
    )
)

if defined VS_PATH (
    echo Found Visual Studio:
    echo %VS_PATH%
) else (
    echo Visual Studio not found. Installing Build Tools...

    where winget >nul 2>nul
    if errorlevel 1 (
        echo ERROR: winget not found
        exit /b 1
    )

    winget install --id Microsoft.VisualStudio.2022.BuildTools -e --accept-package-agreements --accept-source-agreements --override "--wait --passive --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended"

    echo Waiting for installation...
    timeout /t 10 >nul

    for /f "usebackq delims=" %%i in (`%VSWHERE% -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
        set VS_PATH=%%i
    )
)

if not defined VS_PATH (
    echo ERROR: Visual Studio not found
    exit /b 2
)

call "%VS_PATH%\Common7\Tools\VsDevCmd.bat"

where cl >nul 2>nul
if errorlevel 1 (
    echo ERROR: MSVC not available
    exit /b 3
)

echo MSVC ready
echo.

REM ==================================================
REM FIND VCPKG
REM ==================================================

set VCPKG_ROOT=%~dp0vcpkg
set VCPKG_EXE=

if exist "%VCPKG_ROOT%\vcpkg.exe" (
    set VCPKG_EXE=%VCPKG_ROOT%\vcpkg.exe
) else (
    echo vcpkg not found. Installing...

    where git >nul 2>nul
    if errorlevel 1 (
        echo Installing Git...
        winget install --id Git.Git -e --accept-package-agreements --accept-source-agreements
    )

    git clone https://github.com/microsoft/vcpkg "%VCPKG_ROOT%"
    if errorlevel 1 exit /b 4

    call "%VCPKG_ROOT%\bootstrap-vcpkg.bat"
    if errorlevel 1 exit /b 5

    set VCPKG_EXE=%VCPKG_ROOT%\vcpkg.exe
)

echo Using vcpkg:
echo %VCPKG_EXE%
echo.

REM ==================================================
REM INSTALL DEPENDENCIES
REM ==================================================

%VCPKG_EXE% list | findstr /i wxwidgets >nul
if errorlevel 1 (
    echo Installing wxWidgets...
    %VCPKG_EXE% install wxwidgets:x64-windows --recurse
)

%VCPKG_EXE% list | findstr /i opencv4 >nul
if errorlevel 1 (
    echo Installing OpenCV...
    %VCPKG_EXE% install opencv4[core,highgui]:x64-windows --recurse
)

REM ==================================================
REM CMAKE
REM ==================================================

if not exist build mkdir build

cmake -S . -B build ^
-G "Visual Studio 17 2022" ^
-A %ARCH% ^
-DCMAKE_TOOLCHAIN_FILE="%VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake"

if errorlevel 1 exit /b 6

cmake --build build --config Debug

if errorlevel 1 exit /b 7

echo.
echo ==========================================
echo SUCCESS
echo ==========================================

endlocal
exit /b 0
```
