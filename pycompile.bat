:: pycompile.bat

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
    SET ICON=%3

    REM Flags for pyinstaller
    SET FLAGS=--clean --onefile --distpath ./ --log-level WARN

    ECHO Compiling...

    REM Rename old version
    IF EXIST %FILE%.exe REN %FILE%.exe %FILE%_old.exe

    REM Compile as console app
    IF %TYPE%==-c (
        IF %ICON%.==. ( pyinstaller %FILE%.py --name %FILE% %FLAGS% )
        ELSE ( pyinstaller %FILE%.py --name %FILE% %FLAGS% --icon=%ICON% )
    )

    REM Compile as UI app without console
    IF %TYPE%==-w (
        IF %ICON%.==. ( pyinstaller %FILE%.py --name %FILE% %FLAGS% --windowed )
        ELSE ( pyinstaller %FILE%.py --name %FILE% %FLAGS% --windowed --icon=%ICON% )
    )

    REM Remove temporary working files
    DEL %FILE%.spec
    RD /S /Q build

    REM Remove old version
    IF EXIST %FILE%_old.exe DEL /F %FILE%_old.exe

    ECHO Compiled successfully!
GOTO End

:NotEnoughArguments
    ECHO Compiling failed!
    ECHO You must supply the file name and either '-w' or '-c'
GOTO End

:Help
    ECHO =====================================================
    ECHO.
    ECHO   PyCompile v1.0 (by Emanuel Kulich)
    ECHO.
    ECHO   This batch script streamlines the process of
    ECHO   compiling Python projects into executables. Please
    ECHO   note that this script must be placed in the root
    ECHO   directory of your Python project.
    ECHO.
    ECHO   The script takes these three arguments:
    ECHO   FILE        The name of the entrypoint file of
    ECHO               your program, without the '.py' file
    ECHO               extension.
    ECHO   TYPE        Either '-w' (for windowed mode) or
    ECHO               '-c' (for console mode)
    ECHO   ICON        The relative path to your icon file
    ECHO   (optional)  (e.g. 'assets/favicon.ico')
    ECHO.
    ECHO   Example usage:
    ECHO   .\pycompile.bat FILE TYPE ICON
    ECHO.
    ECHO =====================================================
GOTO End

:End
EXIT
