@echo off

REM // 28. Zaplanować automatyczne wyłączenie oraz ponowne uruchomienie komputera.

schtasks /create /tn Shut-Down /sc ONCE /st 15:00 /tr "shutdown -s"
schtasks /create /tn Shut-Down /sc ONCE /st 16:00 /tr "shutdown -r"
pause
