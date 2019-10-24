@echo off REM 7. Jako administrator utwórz konto o nazwie Jan i przypisz mu folder macierzysty w następującej lokalizacji: 
REM C:\Foldery_macierzyste\Jan

MKDIR C:\Foldery_macierzyste\Jan
NET USER Jan * /HOMEDIR:C:\Foldery_macierzyste\Jan /ADD
