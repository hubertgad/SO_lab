REM // 30. Napisaæ skrypt kalkulator o nastêpuj¹cym dzia³aniu:
REM // • kalkulator wykonuje dzia³ania na liczbach ca³kowitych,
REM // • kalkulator obs³uguje operacje: +, -, /, *,
REM // • argumenty oraz operator maj¹ zostaæ podane z klawiatury poprzez dialog ze skryptem,
REM // • kalkulator powinien kontrolowaæ operacjê dzielenia przez zero.

@echo off
  :start
pause
cls
echo Wybierz dzialanie:
echo 1 - Dodawanie
echo 2 - Odejmowanie
echo 3 - Mnozenie
echo 4 - Dzielenie
echo 5 - Wyjscie
set /P wybor=Wybor: 
IF %wybor% EQU 5 (GOTO :E)
set /P x1=Pierwsza liczba:
set /P x2=Druga liczba:
IF %wybor% EQU 1 (GOTO :A)
IF %wybor% EQU 2 (GOTO :B)
IF %wybor% EQU 3 (GOTO :C)
IF %wybor% EQU 4 (GOTO :D)
  :A
set /A odp=x1+x2
echo          %x1% + %x2% = %odp%
GOTO :start
  :B
set /A odp=x1-x2
echo          %x1% - %x2% = %odp%
GOTO :start
  :C
set /A odp=x1*x2
echo          %x1% * %x2% = %odp%
GOTO :start
  :D
IF %x2% EQU 0 (
echo Blad! Dzielenie przez 0!
GOTO :start )
set /A odp=x1/x2
echo          %x1% / %x2% = %odp%
GOTO :start
  :E
echo Koniec...
pause
