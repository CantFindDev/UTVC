@echo off
setlocal enabledelayedexpansion

:: Get the script's directory
set "_mainFolder=%~dp0"
set "_ffmpegFolder=%_mainFolder%ffmpeg"
set "_inputFolder=%_mainFolder%Input"
set "_outputFolder=%_mainFolder%Output"

:: Default Settings
set "_showAdvanced=ON"
set "_outputFileName=UnityReadyVideo.webm"

:: Main Menu
:MainMenu
cls
echo ===========================================
echo  [1;36mUnity Transparent Video Generator[0m
echo  [1;33mDeveloped By CantFind[0m
echo ===========================================
echo  [1] [1;32mSetup Folders[0m
echo  [2] [1;33mConvert Video[0m
echo  [3] [1;34mSettings[0m
echo  [4] [1;35mMore Info[0m
echo  [5] [1;36mSocial[0m
echo  [6] [1;31mExit[0m
===========================================
if defined _errorMessage echo [1;31mError:[0m %_errorMessage%
if defined _successMessage echo [1;32mSuccess:[0m %_successMessage%
set "_errorMessage="
set "_successMessage="
echo.
set /p _menuChoice="[1;36mSelect an option:[0m "

if "%_menuChoice%"=="1" goto SetupFolders
if "%_menuChoice%"=="2" goto CheckFolders
if "%_menuChoice%"=="3" goto Settings
if "%_menuChoice%"=="4" goto MoreInfo
if "%_menuChoice%"=="5" goto SocialMenu
if "%_menuChoice%"=="6" exit
pause
goto MainMenu


:: Main Menu
:SocialMenu
cls
echo ===========================================
echo  [1;36mSocial[0m
echo ===========================================
echo  [1] [1;32mGithub Repository[0m
echo  [2] [1;33mTutorial Video[0m
===========================================
if defined _errorMessage echo [1;31mError:[0m %_errorMessage%
if defined _successMessage echo [1;32mSuccess:[0m %_successMessage%
set "_errorMessage="
set "_successMessage="
echo.
set /p _menuChoice="[1;36mSelect an option:[0m "
if "%_menuChoice%"=="" goto MainMenu
if "%_menuChoice%"=="1" goto OpenRepository
if "%_menuChoice%"=="2" goto OpenYoutubeVideo
pause
goto MainMenu


:OpenRepository
cls
start "" https://github.com/CantFindDev/UnityTransparentVideoGenerator.git
goto SocialMenu

:OpenYoutubeVideo
cls
start "" https://youtu.be/vefFgerTgPc
goto SocialMenu

:: Settings Menu
:Settings
cls
echo ===========================================
echo  [1;34mSettings[0m
echo ===========================================
echo  [1] [1;35mSet Output File Name[0m
echo  [3] [1;33mShow Advanced Info [1;33m^{^[1;32m%_toggleColor%%_showAdvanced%[1;33m^}^[0m
echo  [4] [1;31mBack to Main Menu[0m
===========================================
set /p _settingsChoice="[1;36mSelect an option:[0m "

if "%_settingsChoice%"=="" goto MainMenu
if "%_settingsChoice%"=="1" goto SetOutputFileName
if "%_settingsChoice%"=="3" goto ToggleAdvancedInfo
if "%_settingsChoice%"=="4" goto MainMenu
goto MainMenu

:: Set output file name
:SetOutputFileName
cls
echo ===========================================
echo  [1;35mSet Output File Name[0m
echo ===========================================
echo  Current Output File Name: %_outputFileName%
echo  Enter a new name for the output file (without extension):
set /p "_newFileName="
if defined _newFileName (
    set "_outputFileName=%_newFileName%.webm"
    echo [1;32mOutput file name set to %_outputFileName%![0m
) else (
    echo [1;31mNo name entered. Returning to Settings menu...[0m
)
pause
goto Settings

:: Toggle Advanced Info
:ToggleAdvancedInfo
if "%_showAdvanced%"=="ON" (
    set "_showAdvanced=OFF"
    set "_toggleColor=[1;31m"  :: Red when off
) else (
    set "_showAdvanced=ON"
    set "_toggleColor=[1;32m"  :: Green when on
)
goto Settings

:: Explain Settings
:SettingsInfo
cls
echo ===========================================
echo  [1;34mSettings Info[0m
echo ===========================================
echo  [1] [1;3mSet Output File Name[0m
echo    Change the name of the output WebM file. 
echo    Current name is "%_outputFileName%". You can input your custom name (without extension).
echo    This allows you to easily change the output file's name based on your needs.
echo.
echo  [2] [1;33mShow Advanced Info[0m
echo    Toggle visibility of additional verbose info during execution.
echo    If set to ON, you will see more detailed output (mainly for debugging).
echo    If set to OFF, the output is minimal and concise.
echo.
echo  [3] [1;34mSettings Info[0m
echo    This option! It shows a detailed explanation of each setting option in the script.
echo.
echo  [4] [1;31mBack to Settings Menu[0m
echo    Go back to Settings and make changes to the options listed.
echo ===========================================
echo.
echo  Press any key to go back.
pause >nul
goto MoreInfo

:: More Info (Explanation of options)
:MoreInfo
cls
echo ===========================================
echo  [1;35mMore Info - Unity Transparent Mov To Webm Converter[0m
echo ===========================================
echo  [1] [1;32mSetup Folders[0m
echo    Creates the "Input" and "Output" folders inside the current directory.
echo    The "Input" folder is where you place the MOV, PNG sequence, or MP3/WAV files.
echo    The "Output" folder is where the converted WebM video will be saved.
echo.
echo  [2] [1;33mConvert Video[0m
echo    Converts MOV files with transparency, PNG sequence to a WebM video.
echo    The converted WebM video will maintain transparency (alpha channel).
echo    If audio is available (MP3 or WAV), it will be included in the final WebM.
echo    Use this option after placing your input files in the "Input" folder.
echo.
echo  [3] [1;34mSettings Info[0m
echo    Explains the Settings you can adjust within the script.
echo.
echo  [4] [1;35mMore Info[0m
echo    Displays this information page. Explains what each option does.
echo.
echo  [5] [1;31mExit[0m
echo    Exits the script.
echo.
echo ===========================================
echo.
set /p _infoChoice="Press any key to go back press 3 to learn more about [0;34mSettings[0;37m: "
if "%_infoChoice%"=="3" goto SettingsInfo
if "%_infoChoice%"=="" goto MainMenu
goto MainMenu

:: Setup folders
:SetupFolders
mkdir "%_inputFolder%" 2>nul && set "_successMessage=Input folder created!"
mkdir "%_outputFolder%" 2>nul && set "_successMessage=Output folder created!"

if "%_showAdvanced%"=="ON" (
    echo Input and Output folders are inside:
    echo "%_mainFolder%"
)
echo Please place your .mov, .png sequence, or .mp3/.wav file inside "Input" and return to convert.
pause
goto MainMenu

:: Check if required folders exist
:CheckFolders
if not exist "%_inputFolder%" (
    set "_errorMessage=Input folder missing! Creating it now..."
    mkdir "%_inputFolder%"
    goto MainMenu
)

if not exist "%_outputFolder%" mkdir "%_outputFolder%"

:: Check if FFmpeg exists
if not exist "%_ffmpegFolder%\ffmpeg.exe" (
    set "_errorMessage=FFmpeg not found! Place FFmpeg inside the 'ffmpeg' folder."
    goto MainMenu
)

:: Search for input file types
set "_inputFile="
set "_pngSequence="
set "_audioFile="
for %%f in ("%_inputFolder%\*.mov") do (
    set "_inputFile=%%f"
    goto ConvertMOV 
)

for %%f in ("%_inputFolder%\*.png") do (
    set "_pngSequence=1"
    goto ConvertPNGSequence
)

set "_errorMessage=No supported files found in Input folder. Add a .mov or .png file."
goto MainMenu

:: Convert transparent MOV to WEBM with optional external audio
:ConvertMOV
cls
echo [1;33mDeleting old %_outputFileName% if exists...[0m
del "%_outputFolder%\%_outputFileName%" 2>nul

:: Check for external audio files
set "_audioFile="
for %%f in ("%_inputFolder%\*.mp3") do set "_audioFile=%%f"
for %%f in ("%_inputFolder%\*.wav") do set "_audioFile=%%f"

echo [1;36mConverting "!_inputFile!" to transparent .webm...[0m

if defined _audioFile (
    echo [1;35mUsing external audio: %_audioFile%[0m
    "%_ffmpegFolder%\ffmpeg.exe" -i "!_inputFile!" -i "%_audioFile%" ^
    -c:v libvpx -pix_fmt yuva420p -b:v 1M -auto-alt-ref 0 ^
    -metadata:s:v:0 alpha_mode="1" ^
    -c:a libvorbis -q:a 5 -ar 44100 ^
    -filter_complex "[1:a]atrim=start=0.3,asetpts=PTS-STARTPTS[aud]" ^
    -map 0:v -map "[aud]" ^
    -shortest ^
    -y "%_outputFolder%\%_outputFileName%"
) else (
    echo [1;35mUsing MOV's embedded audio[0m
    "%_ffmpegFolder%\ffmpeg.exe" -i "!_inputFile!" ^
    -c:v libvpx -pix_fmt yuva420p -b:v 1M -auto-alt-ref 0 ^
    -metadata:s:v:0 alpha_mode="1" ^
    -c:a libvorbis ^
    -y "%_outputFolder%\%_outputFileName%"
)

echo [1;32mConversion complete! File saved in "Output".[0m
pause
exit

:: Convert PNG sequence to WEBM with optional audio
:ConvertPNGSequence
cls
echo [1;36mConverting PNG sequence to transparent .webm...[0m

:: Find the first PNG file and determine the filename pattern
set "_firstPng="
for %%f in ("%_inputFolder%\*.png") do (
    set "_firstPng=%%~nf"
    set "_pngExtension=%%~xf"
    goto PNGFound
)

:PNGFound
if not defined _firstPng (
    set "_errorMessage=No PNG sequence found!"
    goto MainMenu
)

:: Extract the common filename pattern for the sequence
for %%f in ("%_inputFolder%\*.png") do (
    for /f "tokens=1 delims=0123456789" %%a in ("%%~nf") do (
        set "_filePattern=%%a"
        goto SequenceFound
    )
)

:SequenceFound
set "_sequencePattern=%_filePattern%*.png"

:: Check for audio files
set "_audioFile="
for %%f in ("%_inputFolder%\*.mp3") do set "_audioFile=%%f"
for %%f in ("%_inputFolder%\*.wav") do set "_audioFile=%%f"

del "%_outputFolder%\%_outputFileName%" 2>nul

if defined _audioFile (
    "%_ffmpegFolder%\ffmpeg.exe" ^
    -framerate 30 -i "%_inputFolder%\%_filePattern%%%05d%_pngExtension%" ^
    -i "%_audioFile%" ^
    -c:v libvpx -pix_fmt yuva420p -b:v 1M -auto-alt-ref 0 ^
    -c:a libvorbis -q:a 5 -ar 44100 ^
    -filter_complex "[1:a]atrim=start=0.3,asetpts=PTS-STARTPTS[aud]" ^
    -map 0:v -map "[aud]" ^
    -shortest ^
    -y "%_outputFolder%\%_outputFileName%"
) else (
    "%_ffmpegFolder%\ffmpeg.exe" ^
    -framerate 30 -i "%_inputFolder%\%_filePattern%%%05d%_pngExtension%" ^
    -c:v libvpx -pix_fmt yuva420p -b:v 1M -auto-alt-ref 0 ^
    -metadata:s:v:0 alpha_mode="1" ^
    -y "%_outputFolder%\%_outputFileName%"
)

echo [1;32mConversion complete! File saved in "Output".[0m
pause
exit