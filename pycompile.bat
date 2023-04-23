:: pycompile.bat
:: Run .\pycompile.bat -h (or --help) for instructions

@ECHO OFF

REM Show help information
IF /i "%~1"=="-h" GOTO Help
IF /i "%~1"=="--help" GOTO Help

REM If required arguments are not supplied
IF %1.==. GOTO NotEnoughArguments
IF %2.==. GOTO NotEnoughArguments

:Start
    CLS

    SET FILE=%1
    SET TYPE=%2

    REM Flags for pyinstaller
    SET FLAGS=--clean --onefile --distpath ./ --log-level WARN

    ECHO Compiling...

    REM Rename old version
    IF EXIST %FILE%.exe REN %FILE%.exe %FILE%_old.exe

    REM Compile as console app
    IF %TYPE%==console ( pyinstaller %FILE%.py --name %FILE% %FLAGS% )

    REM Compile as UI app without console
    IF %TYPE%==windowed ( pyinstaller %FILE%.py --name %FILE% --windowed %FLAGS% )

    REM Remove temporary working files
    DEL %FILE%.spec
    RD /S /Q build

    REM Remove old version
    IF EXIST %FILE%_old.exe DEL /F %FILE%_old.exe

    ECHO Compiled successfully!
GOTO End

:NotEnoughArguments
    ECHO Compiling failed!
    ECHO You must supply the file name and either 'windowed' or 'console'
GOTO End

:Help
    ECHO =====================================================
    ECHO.
    ECHO   PyCompile v1.0 (by Emanuel Kulich)
    ECHO.
    ECHO   This script uses pyinstaller to compile Python
    ECHO   files into executables. Make sure that you have
    ECHO   the pyinstaller module installed before starting.
    ECHO.
    ECHO   Please note that this script must be placed in the
    ECHO   root directory of your Python project.
    ECHO.
    ECHO   Example usage:
    ECHO   .\pycompile.bat FILE TYPE
    ECHO.
    ECHO   The TYPE can be either 'windowed' or 'console'
    ECHO.
    ECHO =====================================================
GOTO End

:End
EXIT
