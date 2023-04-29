# ⚙️ PyCompile

This batch script streamlines the process of compiling Python projects into executables. Please note that this script must be placed in the root directory of your Python project.

Currently, this script is only compatible with Windows. However, a Linux alternative using bash could be on the roadmap. If You would like to contribute this bash script, please create a pull request.

## Installation
1. Clone the repository:
    ```
    git clone https://github.com/svedev0/PyCompile
    ```
2. Install the requirements:
    ```
    pip install pyinstaller
    ```

## Usage:
The script takes these three arguments:
| Argument        | Definition                                                                         |
|:----------------|:-----------------------------------------------------------------------------------|
| FILE            | The name of the entrypoint file of your program, without the `.py` file extension. |
| TYPE            | Either `-w` (for windowed mode) or `-c` (for console mode)                         |
| ICON (optional) | The relative path to your icon file (e.g. `assets/favicon.ico`)                    |

Example usage:
```powershell
.\pycompile.bat FILE TYPE ICON
```

If you need help, run:
```powershell
.\pycompile.bat --help
```
