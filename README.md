# PyCompile

This batch script uses pyinstaller to streamline the process of compiling Python files into executables. Please note that this script must be placed in the root directory of your Python project.

Install required modules:
```
pip install pyinstaller
```

Example usage:
```
.\pycompile.bat FILE TYPE
```

FILE should be only the name of the file (e.g. main) without the '.py' file extension.

TYPE can be either 'windowed' or 'console'
