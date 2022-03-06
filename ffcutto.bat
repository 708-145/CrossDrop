@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%
@ECHO OFF
SET /P min=Please enter start minute: 
IF "%min%"=="" GOTO Error
SET /P sec=Please enter start second: 
IF "%sec%"=="" GOTO Error
SET /P emin=Please enter end minute: 
IF "%min%"=="" GOTO Error
SET /P esec=Please enter end second: 
IF "%sec%"=="" GOTO Error
@set exe=%ffmpegpath% -i %1 -ss 00:%min%:%sec% -to 00:%emin%:%esec% -c copy "%~d1%~p1%~n1_cut%min%%sec%_%emin%%esec%.mkv"
@echo %exe%
%exe%
exit
:error
@echo Input missing
@pause