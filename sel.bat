@echo off

setlocal enableextensions enabledelayedexpansion

set idx=1
:loop
    cls
    echo.
    echo Current Directory: %cd%

    call :print_dir !idx! , sel , n
    choice /c wsadx /n
    
    @REM if 'w' key is pressed - move selected directory up
    if %errorlevel%==1 (
        if %idx% GTR 1 (
            set /a idx-=1
        )
    )
    @REM if 's' key is pressed - move selected directory down
    if %errorlevel%==2 (
        if %idx% LSS !n! (
            set /a idx+=1
        )
    )
    @REM if 'a' key is pressed - get back to parent directory
    if %errorlevel%==3 (
        endlocal
        cd ..
        setlocal enableextensions enabledelayedexpansion
        set idx=1
        goto :loop
    )
    @REM if 'd' key is pressed -enter selected directory
    if %errorlevel%==4 (
        @REM echo %sel%
        endlocal & cd %sel%
        setlocal enableextensions enabledelayedexpansion
        set idx=1
        goto :loop
    )
    if %errorlevel%==5 (
        cls
        goto :eof
    )

    goto :loop

:print_dir
    set i=0
    for /d %%D in (*) do (
        set /a i+=1
        if %~1==!i! (
            echo ^> %%~D
            set %2=%%~D
        ) else (
            echo   %%~D
        )
    )
    set %3=!i!