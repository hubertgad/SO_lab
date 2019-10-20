@echo off
REM // 30. Napisaæ skrypt kalkulator o nastêpuj¹cym dzia³aniu:
REM // • kalkulator wykonuje dzia³ania na liczbach ca³kowitych,
REM // • kalkulator obs³uguje operacje: +, -, /, *,
REM // • argumenty oraz operator maj¹ zostaæ podane z klawiatury poprzez dialog ze skryptem,
REM // • kalkulator powinien kontrolowaæ operacjê dzielenia przez zero.

set /A odp=%1%2%3
IF "%2%=="/" && 
echo ---
echo 		%1 %2 %3 = %odp%
echo ---
GOTO :EOF
:0ERROR
echo Blad. Nie mozna dzielic przez 0.