REM 9. Sprawdź kiedy ostatnio logował się użytkownik Jan na swoje konto? Podaj dokładną datę i godzinę logowania.

wmic netlogin get Name,NumberOfLogons,LastLogon
