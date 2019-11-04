@echo off
REM 14. Napisać skrypt, który pobierze listę użytkowników z pliku tekstowego, a następnie utworzy dla nich konta. 
REM Nazwa pliku ma zostać podana jako parametr wejściowy do skryptu. 
REM W przypadku braku parametru wejściowego skrypt powinien wyświetlić odpowiedni komunikat. 
REM Skrypt ma także sprawdzać czy plik, którego nazwę podano jako parametr wejśćiowy istnieje w podanej lokalizacji. 
REM Zawartość pliku z danymi powinna wyglądać następująco:
REM 1,Jan Kowalski,kowalj
REM 2,Jozef Nowak,nowakj
REM .
REM .
REM .
REM 10,Funky Koval,funky
REM 11,Brenda,brenda
REM Jako separatora pól zastosować przecinek.

IF [%1] EQU [] (
ECHO Nie znaleziono parametru...
GOTO :EOF )
IF NOT EXIST %1.txt (
ECHO Nie znaleziono pliku...
GOTO :EOF )
FOR /F "delims=, tokens=2-3" %%G in (%1.txt) DO (
NET USER "%%G" /ADD )
pause
