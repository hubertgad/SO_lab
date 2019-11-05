REM 17. Utworzyc plik wsadowy, który usunie wszystkie pliki o rozszerzeniu .bak i .tmp z katalogu
REM podanego jako parametr. Skrypt powinien sprawdzac czy podano parametr. 
REM Jesli go nie podano, to na ekranie powinna zostac wydrukowana poprawna składnia uzycia polecenia.

@echo off
IF [%1] NEQ [] (
DEL %1\*.bak % DEL %1\*.tmp
) ELSE (
ECHO Podaj sciezke do katalogu! )
