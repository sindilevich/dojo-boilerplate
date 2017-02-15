@echo off

rem Destination directory for built code
set DISTDIR=dist

echo Building application with "%PROFILE%" to "%DISTDIR%".

if exist "%DISTDIR%" (
	echo | set /p=Cleaning old files...
	rmdir /s /q "%DISTDIR%"
	echo  done
)

call node_modules\.bin\stylus.cmd "src\app\resources\app.styl"
call src\util\buildscripts\build.bat --profile profiles\app.profile.js --releaseDir ..\%DISTDIR% > results.log 2>&1

echo Build complete