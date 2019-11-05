@echo off
REM 19. Napisac program wsadowy, który spowoduje wyswietlenie na ekranie nazwy zalogowanego uzytkownika,
REM litere dysku oraz nazwe katalogu macierzystego oraz informacje o procesorze znajdujacym sie w systemie.

ECHO %USERNAME%
ECHO %HOMEDRIVE%
ECHO %HOMEPATH%
ECHO %PROCESSOR_ARCHITECTURE% %PROCESOR_LEVEL%
