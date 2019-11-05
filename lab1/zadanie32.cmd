@echo off
REM 32. Napisać skrypt, który będzie podawał status wyjścia aplikacji uruchomionej przez skrypt.
REM Skrypt ma zapytać się użytkownika o nazwę aplikacji, którą ma uruchomić.

SET /p nazwa = Podaj nazwe aplikacji, ktora mam uruchomic: 
CALL %nazwa%
ECHO Aplikacja zakonczona z kodem %ERRORLEVEL%.
