@echo off
REM 3. Usuń założone grupy i użytkowników z linii poleceń. Sprawdź czy operacje usunięcia się powiodły.

FOR /L %%G IN (1, 1, 5) DO (net user Student%%G /delete)
net localgroup "Studenci" /delete
