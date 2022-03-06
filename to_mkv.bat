@echo To Mkv converter
@echo (c) 20200805 Tobias Bergmann

@if [%1]==[] goto skip

@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%

@if exist %ffmpegpath% (
  %ffmpegpath% -i %1 -c copy "%~d1%~p1%~n1.mkv"
) else (
  echo Needs ffmpeg.exe in the same directory! Exiting...
)

exit

:skip
@pause
