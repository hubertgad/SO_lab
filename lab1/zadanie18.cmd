@echo off
REM 18. Zmodyfikowac skrypt z zadania poprzedniego tak, aby maski plików do usuniecia były podawane z linii polecen. 
REM Rozwazyc mozliwosc podania wiecej jak jednego parametru.

IF [%1] EQU [] (
ECHO Podaj sciezke do katalogu!
GOTO :EOF )

:LAB
IF [%2] NEQ [] (
DEL %1\*.%2
SHIFT
GOTO :LAB
)
