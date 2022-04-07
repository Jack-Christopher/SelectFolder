@echo off

setlocal enableextensions enabledelayedexpansion

set idx=1
:loop
    cls
    echo.
    echo Current Directory: %cd%

    call :print_dir !idx! , n
    choice /c ws /n
    
    @REM if 'w' key is pressed
    if %errorlevel%==1 (
        if %idx% GTR 1 (
            set /a idx-=1
        )
    )
    @REM if 's' key is pressed
    if %errorlevel%==2 (
        if %idx% LSS !n! (
            set /a idx+=1
        )
    )

    goto :loop

:print_dir
    set i=0
    for /d %%D in (*) do (
        set /a i+=1
        if %~1==!i! (
            echo ^> %%~D
        ) else (
            echo   %%~D
        )
    )
    set %2=!i!