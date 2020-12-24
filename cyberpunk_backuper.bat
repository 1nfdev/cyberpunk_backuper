:: Currently Cyberpunk 2077 save can't be more than 8 MB
:: This script backuping your saves

@ECHO OFF
CLS
COLOR 0f

Title Create Cyberpunk 2077 saves backup

@cd/d "%~dp0"

SETLOCAL

:: Get Current Time

SET YEAR=%date:~6,4%
SET MONTH=%date:~3,2%
SET DAY=%date:~0,2%

SET HOUR=%time:~0,2%
IF %HOUR% lss 10 (SET HOUR=0%time:~1,1%)

SET NN=%time:~3,2%
SET SS=%time:~6,2%
SET MS=%time:~9,2%

SET timestamp=%YEAR%-%MONTH%-%DAY%_%HOUR%-%NN%-%SS%-%MS%

:: Backup

SET SavesBackups=%CD%\SavesBackups\%timestamp%
SET SavesFolder=%USERPROFILE%\Saved Games\CD Projekt Red\Cyberpunk 2077

ECHO Saves:
DIR /b "%SavesFolder%"

ECHO.
ECHO Saves coping to %SavesBackups%
ECHO.

IF NOT EXIST "%SavesBackups%" MD "%SavesBackups%"

XCOPY /S "%SavesFolder%" "%SavesBackups%"
IF NOT EXIST "%SavesBackups%" ECHO "Backuping saves is failing"

ECHO.
ECHO Backup attempt completed
ECHO.

:: Is folder empty
SET _temp=
FOR /f "delims=" %%a in ('DIR /a /b "%SavesBackups%"') do SET _temp=%%a

IF {%_temp%} NEQ {} (
	ECHO Backup created
	ECHO.

	ECHO Backuped saves:
	DIR /b "%SavesBackups%"
	ECHO.
)

PAUSE
