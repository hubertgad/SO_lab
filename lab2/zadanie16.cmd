@echo off
REM 16. Napisać skrypt, który nada określone prawa dostępu danemu użytkownikowi do danego zasobu.
REM Wszystkie potrzebne dane powinny być podane jako parametry skryptu.

REM %1 - katalog 
REM %2 - nazwa użytkownika 
REM %3 - uprawnienie

:LAB1
IF [%3] NEQ [] (
ICACLS %1 /grant %2:%3
SHIFT /3
GOTO :LAB1)
