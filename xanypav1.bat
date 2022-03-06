@echo Simple realtime same res AOM AV1 encoder for any input.
@echo Applies mild filtering and medium effort compression.
@echo Invoke by drag and drop input video over the .bat icon
@echo     or by giving input video as 1st parameter from CLI
@echo Will generate an encoded file in the same directory as source.
@echo (c) 20220111 Tobias Bergmann

@if [%1]==[] goto skip

@set ffmpegpath=%~d0%~p0ffmpeg.exe
@echo Searching ffmpeg.exe at %ffmpegpath%

@if exist %ffmpegpath% (
  %ffmpegpath% -i %1 -filter:v hqdn3d=4.0:3.0:6.0:4.5 -sws_flags lanczos -c:v libaom-av1 -cpu-used 8 -row-mt 1 -tiles 4x2 -crf 24 -b:v 0 -c:a libopus -b:a 128k "%~d1%~p1%~n1_anypav1.mkv"
  pause
) else (
  echo Needs ffmpeg.exe in the same directory! Exiting...
)

exit

:skip
@pause
