@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%
@ECHO OFF
@set exe=%ffmpegpath% -i %1 -af "compand=.3:1:-90/-60|-60/-40|-40/-30|-20/-20:6:4:-90:0.2" -ab 96k "%~d1%~p1%~n1_comp.mp3"
@echo %exe%
%exe%
exit
:error
@echo Input missing
@pause