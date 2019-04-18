@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%
@ECHO OFF
SET /P min=Please enter start minute: 
IF "%min%"=="" GOTO Error
SET /P sec=Please enter start second: 
IF "%sec%"=="" GOTO Error
SET /P dmin=Please enter duration minute: 
IF "%min%"=="" GOTO Error
SET /P dsec=Please enter duration second: 
IF "%sec%"=="" GOTO Error
@set exe=%ffmpegpath% -i %1 -c copy -ss 00:%min%:%sec% -t 00:%dmin%:%dsec% "%~d1%~p1%~n1_cut%~x1"
@echo %exe%
%exe%
exit
:error
@echo Input missing
@pause