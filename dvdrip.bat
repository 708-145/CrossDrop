@echo Simple single-click DVD ripper using vlc cli
@echo Will generate a vob file in the same directory as batch file (or link to batch file)
@echo (c) 20220223 Tobias Bergmann

@echo TODO: detect VLC location, for now hard code
@set vlcpath="%PROGRAMFILES%\VideoLAN\VLC\vlc.exe"

@echo TODO: detect current directory
@set curdir=C:\Dokumente und Einstellungen\tobia\Desktop

@echo TODO: detect DVD drive name, for now always use E:
@set dvddrive=E:

@echo TODO: get disk label for target filename
vol %dvddrive%
@set dvdlabel=filmname


@echo TODO: call vlc
@set command=%vlcpath% --no-repeat --no-loop -I dummy dvdsimple:///E:/ --prefetch-buffer-size=80000 --no-sout-spu --sout-transcode-acodec=copy --sout-transcode-vcodec=copy --sout-standard-access=file --sout-standard-mux=ps --sout=%dvdlabel%.vob vlc://quit
@echo %command%
cd %curdir%
%command%

pause
exit
