@echo off
REM // 30. Napisa� skrypt kalkulator o nast�puj�cym dzia�aniu:
REM // � kalkulator wykonuje dzia�ania na liczbach ca�kowitych,
REM // � kalkulator obs�uguje operacje: +, -, /, *,
REM // � argumenty oraz operator maj� zosta� podane z klawiatury poprzez dialog ze skryptem,
REM // � kalkulator powinien kontrolowa� operacj� dzielenia przez zero.

set /A odp=%1%2%3
IF "%2%=="/" && 
echo ---
echo 		%1 %2 %3 = %odp%
echo ---
GOTO :EOF
:0ERROR
echo Blad. Nie mozna dzielic przez 0.