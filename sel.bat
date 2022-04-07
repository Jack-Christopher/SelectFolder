@echo off

setlocal enableextensions enabledelayedexpansion

set idx=1
:loop
    cls
    echo.
    echo Current Directory: %cd%

    call :print_dir
    
    goto :loop

:print_dir
    for /d %%D in (*) do (
        echo   %%~D
    )