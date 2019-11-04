@echo off 
REM 17. Zalogować się jako administrator. Utworzyć folder C:\dane_admina. 
REM Nadaj użytkownikowi admin prawo Pełna kontrola do tego folderu i utworzyć wewnątrz niego plik plik_admina.txt o dowolnej treści.

MKDIR "C:\dane_admina"
ICACLS "C:\dane_admina" /grant "admin:F"
echo dowolna_treść > C:\dane_admina\plik_admina.txt
