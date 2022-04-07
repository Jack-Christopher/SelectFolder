@echo off

setlocal enableextensions enabledelayedexpansion

:loop
    cls
    echo.
    echo Current Directory: %cd%

    for /d %%D in (*) do (
        echo   %%~D
    )
        goto :loop
    