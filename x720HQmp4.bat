@echo Simple realtime 720p (1K) H.264/AAC encoder for any input.
@echo Applies mild filtering and medium effort compression.
@echo Invoke by drag and drop input video over the .bat icon
@echo     or by giving input video as 1st parameter from CLI
@echo Will generate an encoded file in the same directory as source.
@echo (c) 20141216 Tobias Bergmann

@if [%1]==[] goto skip

@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%

@if exist %ffmpegpath% (
  rem start /belownormal 
  %ffmpegpath% -i %1 -f mp4 -filter:v hqdn3d=4.0:3.0:6.0:4.5 -sws_flags lanczos -c:v libx264 -s hd720 -crf 18 -preset medium -x264opts keyint=4 -c:a copy "%~d1%~p1%~n1_720pk4.mp4"
) else (
  echo Needs ffmpeg.exe in the same directory! Exiting...
)

exit

:skip
@pause
