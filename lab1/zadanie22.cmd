@echo off

REM //22. Napisać skrypt który zamieni rozszerzenia wszystkich plików *.txt na *.tx_. Rozszerzyć funkcjonalność skryptu o podawanie rozszerzeń jako parametry skryptu.

REM RENAME *.txt *tx_ - wersja pierwsza
RENAME *.%1 *.%2
