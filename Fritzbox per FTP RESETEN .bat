@echo off
set IP=192.168.178.1
set OUT=fritz_env.txt

ftp -n -s:ftp_commands.txt %IP% > "%OUT%"

echo Fertig. Ausgabe in %OUT%
pause
