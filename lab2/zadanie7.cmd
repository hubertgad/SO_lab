REM 7. Jako administrator utwórz konto o nazwie Jan i przypisz mu folder macierzysty w następującej lokalizacji: 
REM C:\Foldery_macierzyste\Jan.

mkdir C:\Foldery_macierzyste\Jan
net user Jan * /HOMEDIR:C:\Foldery_macierzyste\Jan /add
