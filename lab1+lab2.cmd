@echo off
REM 1. Zapoznać się z możliwościami konﬁguracji okna Wiersza polecenia.
REM (a) Zmień tytuł okna wiersza polecenia na Systemy operacyjne - laboratorium. 
REM (b) Zmień kolor tla wiersza polecenia na niebieski, a kolor czcionki na żółty.
title "Systemy operacyjne - laboratorium" & color 16

@echo off
REM 3. Wyswietl godzine i date bez monitu o zmiane daty.
date /t & time /t

@echo off
REM 4. Sporzadz raport stanu dysku i umiesc go w pliku raport_dysk.
chkdsk > raport_dysku.txt

@echo off
REM 5. Napisz instrukcje, która spowoduje wyswietlenie na ekranie zawartosci pliku raport_dysk.
TYPE raport_dysku.txt

@echo off
REM 6. Napisac instrukcje, która wyswietli wszystkie pliki z katalogu głównego na dysku c.
DIR /A C:

@echo off
REM 7. Napisac instrukcje, która wyswietli wszystkie katalogi w katalogu głównym na dysku c.
DIR C: /A:D

@echo off
REM 8. Wyswietlic wszystkie pliki z katalogu system32 w kolejnosci alfabetycznej według rozszerzenia.
DIR /A %systemroot%\system32 O:E

@echo off
REM 9. Napisac polecenie, które skopiuje wszystkie pliki z katalogu nadrzednego wzgledem biezacego do katalogu biezacego. Kopiowanie powinno odbyc sie z weryfikacja danych.
COPY .. /V

@echo off
REM 10. Utworzyc katalogi KAT1 i KAT2. Do katalogu Kat2 skopiowac pliki z katalogu system32, których druga litera nazwy jest d.
MKDIR KAT1 & MKDIR KAT2
COPY %SYSTEMROOT%\system32\?d*.* KAT1

@echo off
REM 11. Napisac instrukcje, która spowoduje usuniecie pustego katalogu o nazwie KAT1.
DEL KAT1 /Q

@echo off
REM 12. Napisac instrukcje, która spowoduje usuniecie niepustego katalogu o nazwie KAT2.
DET KAT2 /S

@echo off
REM 13. Utworzyc plik o nazwie dane.h i nadac mu atrybut ukryty. Sprawdzic poleceniem dir, czy jest widoczny.
NULL > C:\dane.h
ATTRIB +H C:\dane.h
DIR C:\dane.h

@echo off
REM 14. Napisac polecenie, które utworzy plik o nazwie dane.txt oraz umozliwi wpisanie 
REM do niego ciagu znaków z poziomu wiersza polecenia. 
REM UWAGA! Wykorzystac polecenie copy. Koniec wpisywania znaków do pliku zasygnalizowac sekwencja ctrl+Z.
COPY con > file.txt

@echo off
REM 15. Zmienic znak zachety na biezaca godzine zakonczona znakiem wiekszosci.
PROMPT &T $G

@echo off
REM 16. Zapoznac sie z poleceniami: if, for, call, goto.

@echo off
REM 17. Utworzyc plik wsadowy, który usunie wszystkie pliki o rozszerzeniu .bak i .tmp z katalogu
REM podanego jako parametr. Skrypt powinien sprawdzac czy podano parametr. 
REM Jesli go nie podano, to na ekranie powinna zostac wydrukowana poprawna składnia uzycia polecenia.
IF [%1] NEQ [] (
DEL %1\*.bak % DEL %1\*.tmp
) ELSE (
ECHO Podaj sciezke do katalogu! )

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
GOTO :LAB )

@echo off
REM 19. Napisac program wsadowy, który spowoduje wyswietlenie na ekranie nazwy zalogowanego uzytkownika,
REM litere dysku oraz nazwe katalogu macierzystego oraz informacje o procesorze znajdujacym sie w systemie.
ECHO %USERNAME%
ECHO %HOMEDRIVE%
ECHO %HOMEPATH%
ECHO %PROCESSOR_ARCHITECTURE% %PROCESOR_LEVEL%

@echo off
REM 20. Dodać zadanie do harmonogramu zadań, polegające na uruchomieniu programu defragmentator dysku w wybranym dniu o wybranej godzinie
schtasks /create /tr defrag /tn nazwa /sc ONCE /st 15:00 

@echo off
REM 21. Napisać skrypt wypisujący na ekranie liczby całkowite z danego przedziału podanego z lini poleceń.
FOR /L %%G IN (%1, 1, %2) DO (echo %G)

@echo off
REM 22. Napisać skrypt który zamieni rozszerzenia wszystkich plików *.txt na *.tx_. Rozszerzyć funkcjonalność skryptu o podawanie rozszerzeń jako parametry skryptu.
REM RENAME *.txt *tx_ - wersja pierwsza
RENAME *.%1 *.%2

@echo off
REM 23. Wyświetlić na ekranie listę otwartych udostępnionych plików oraz ich blokady.
net file

@echo off
REM 24. Wyświetlić listę połączeń sieciowych komputera.
netstat

@echo off
REM 25. Uruchomić program notatnik z priorytetem czasu rzeczywistego.
start /realtime notepad

@echo off
REM 27. Przeanalizować potrzebę wykonania defragmentacji dysku twardego.
defrag /C /A /V

@echo off
REM 28. Zaplanować automatyczne wyłączenie oraz ponowne uruchomienie komputera.
schtasks /create /tn Shut-Down /sc ONCE /st 15:00 /tr "shutdown -s"
schtasks /create /tn Shut-Down /sc ONCE /st 16:00 /tr "shutdown -r"

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

@echo off
REM 30. Napisać skrypt kalkulator o następującym działaniu:
REM - kalkulator wykonuje działania na liczbach całkowitych,
REM - kalkulator obsługuje operacje: +, -, /, *,
REM - argumenty oraz operator mają zostać podane z klawiatury poprzez dialog ze skryptem,
REM - kalkulator powinien kontrolować operację dzielenia przez zero.
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

@echo off
REM 32. Napisać skrypt, który będzie podawał status wyjścia aplikacji uruchomionej przez skrypt.
REM Skrypt ma zapytać się użytkownika o nazwę aplikacji, którą ma uruchomić.













