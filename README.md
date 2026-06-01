wxModularApp
============

Cross-Platform Modular Application (Main app + plugins) example for C++/wxWidgets

Requirements
------------
* Compiled shared (DLL Debug/DLL Release) version of wxWidgets. [Git Master](https://github.com/wxWidgets/wxWidgets) or official [3.0.x](http://wxwidgets.org/downloads/) release should work fine.
* [CMake](http://www.cmake.org/) - v3.16 or later is required on all platforms. It is used for creating 
  * Visual Studio projects under Windows
  * Makefiles under Linux
  * XCode projects under OS X
* Under Windows `%WXWIN%` environment variable is required. Should point to wxWidgets source folder (e.g. `C:\libs\wxWidgets-svn`)
* Ensure that you have only `vc_dll` subfolder in `%WXWIN%/libs`. If you have `vc_lib*` folders (contain static build of wxWidgets) then rename them temporary.

## Compilation under Windows

You can build this project automatically using `build.bat`.

Before running, make sure `winget` is installed on your system.

Run in the project root: `build.bat`

The script will automatically:

- install Visual Studio 2022 Build Tools (if missing)
- install Git and CMake (if missing)
- download and build `vcpkg` (if missing)
- install wxWidgets and `OpenCV` via `vcpkg`
- configure the CMake project
- build the project into the build/ folder

Important

The project path must NOT contain:

- Cyrillic characters
- spaces

Example of a correct path: 

C:\Projects\wxVideoProcessing

Wrong examples:

C:\Users\Name\Desktop\мой проект
C:\Users\Name\Desktop\wx video project

Common issue

If CMake shows cache or path errors, delete the build/ folder and run the script again: `build/`
