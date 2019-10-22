@echo off

REM // 20. Dodać zadanie do harmonogramu zadań, polegające na uruchomieniu programu defragmentator dysku w wybranym dniu o wybranej godzinie

net start "task scheduler"
schtasks /create /tr defrag /sc ONCE /st 15:00 
pause
