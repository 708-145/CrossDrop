@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%
@ECHO OFF
SET /P quality=Please enter quality: 
IF "%quality%"=="" GOTO Error
@set exe=%ffmpegpath% -i %1 -c:v copy -c:a libopus -vbr on -compression_level 10 -ab %quality%k "%~d1%~p1%~n1_opus%quality%.opus"
@echo %exe%
%exe%

exit
:error
@echo Input missing
@pause