@echo off
REM 23. Sprawdzić jakie są obecnie ustawione limity przydziałów: fsutil quota query C:.
REM Następnie ustawić użytkownikowi Student1 limity na 60 MB (poziom ostrzeżeń, w bajtach: 62914560 = 60·220) 
REM i 100 MB (limit końcowy, w bajtach: 104857600 = 100·220).
REM Ponownie sprawdzić ustawienia linitu przydziałów.
REM Następnie zmienić limity na 80 MB (83886080 B, poziom ostrzeżeń) i 120MB (125829120 B, limit końcowy).

fsutil quota query C:
fsutil quota modify 62914560 104857600 Student1
fsutil quota query C:
fsutil quota modify 83886080 125829120 Student1
