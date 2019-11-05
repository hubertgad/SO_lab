@echo off
REM 30. Napisać skrypt kalkulator o następującym działaniu:
REM - kalkulator wykonuje działania na liczbach całkowitych,
REM - kalkulator obsługuje operacje: +, -, /, *,
REM - argumenty oraz operator mają zostać podane z klawiatury poprzez dialog ze skryptem,
REM - kalkulator powinien kontrolować operację dzielenia przez zero.

IF "%2"=="/" (
	IF "%3"=="0" GOTO :0ERROR
	)
set /A odp=%1%2%3
echo ---
echo 		%1 %2 %3 = %odp%
echo ---
GOTO :EOF
:0ERROR
echo Blad. Nie mozna dzielic przez 0.
