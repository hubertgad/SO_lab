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

REM 16. Z
@echo offapoznac sie z poleceniami: if, for, call, goto.
