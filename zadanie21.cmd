@echo off

REM // 21. Napisać skrypt wypisujący na ekranie liczby całkowite z danego przedziału podanego z lini poleceń.

FOR /L %%G IN (%1, 1, %2) DO (echo %G)
pause
