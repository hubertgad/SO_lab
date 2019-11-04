@echo off
REM 16. Napisać skrypt, który nada określone prawa dostępu danemu użytkownikowi do danego zasobu.
REM Wszystkie potrzebne dane powinny być podane jako parametry skryptu.

REM %1 - katalog 
REM %2 - nazwa użytkownika 
REM %3 - uprawnienie

FOR /L %%G IN (3, 1, 9) DO ( IF [%%G] NEQ [] DO (
ICACLS %1 %2 /grant "%2:%%%G" ) ELSE (
GOTO :EOF ))
