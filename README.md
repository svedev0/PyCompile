# PyCompile

This batch script streamlines the process of compiling Python projects into executables. Please note that this script must be placed in the root directory of your Python project.

Currently, this script is only compatible with Windows. However, a Linux alternative using bash is on the roadmap.

Install requirements:
```
git clone https://github.com/svedev0/PyCompile
pip install pyinstaller
```

Usage:
```
.\pycompile.bat FILE TYPE
```

`FILE` should be only the name of the file (e.g. main) without the `.py` file extension.

`TYPE` can be either `-w` (for windowed mode) or `-c` (for console mode)

If you need help, run:
```
.\pycompile.bat --help
```
