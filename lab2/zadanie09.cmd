REM 9. Sprawdź kiedy ostatnio logował się użytkownik Jan na swoje konto? Podaj dokładną datę i godzinę logowania.

REM wmic user netlogin WHERE name="Jan" get LastLogon /all
