@echo off
rem setlocal enableDelayedExpansion
set /p "pathName= please enter a path :" 
echo %pathName% > pathName.txt
pushd %pathName%
dir /B> fileList.txt

goto :commentout
 
findstr /r ":" pathName.txt  
echo %errorlevel%
set driveName=
set /a count= 0
:looper
    echo !pathName:~%count%,1!
    if not "!pathName:~%count%,1!" == ":" (
        set driveName=%driveName%!pathName:~%count%,1!
        set /a count= %count% + 1
        goto :looper
    )
    goto :endLooper  
:endLooper
    set driveName=%driveName%:
    echo %driveName% > pathName.txt
:commentout
