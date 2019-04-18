@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%
@ECHO OFF
SET /P min=Please enter minute: 
IF "%min%"=="" GOTO Error
SET /P sec=Please enter second: 
IF "%sec%"=="" GOTO Error
@set exe=%ffmpegpath% -i %1 -c copy -ss 00:%min%:%sec% "%~d1%~p1%~n1_cut%min%%~x1"
@echo %exe%
%exe%

exit
:error
@echo Input missing
@pause