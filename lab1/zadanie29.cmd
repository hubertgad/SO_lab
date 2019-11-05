@echo off
REM 29. Napisać grę zgadywankę, o następującym działaniu:
REM - komputer losuje liczbę całkowitą z zakresu od 0 do 100,
REM - użytkownik próbuje zgadnąć tę liczbę mając 6 prób,
REM - po nieudanej próbie komputer informuje gracza czy podana przez niego liczba była za duża czy za mała,
REM - gracz wygrywa gdy uda mu się zgadnąć liczbę.

echo Wylosuje teraz liczbe z zakresu od 1 do 100.
set /a x = %random% % 100
set l=6
set /p y="Odgadnij, jaka liczbe wylosowalem: "
:label
set /a l=l-1
IF %x% EQU %y% DO (
  echo  Gratulacje! WYGRALES!
) ELSE (
  echo  Przykro  mi.
  IF %l% EQU 0 (
    echo  Przegrales.
    GOTO :EOF )
  echo  Sprobuj ponownie. Liczba prob, ktore Ci pozostaly: %l% )
  echo ------------------------------------------------------------
  GOTO :label )
 pause
