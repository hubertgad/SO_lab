@echo off
REM 2. Utwórz następujące konta użytkowników przynależące do różnych grup:
REM • Student1 – Użytkownicy zaawansowani,
REM • Student2 – Użytkownicy,
REM • Student3 – Goście,
REM • Student4 – Administratorzy,
REM • Student5 – Studenci.

net user Student1 fred_ąć /ADD 
net localgroup "Użytkownicy zaawansowani" Student1 /add
net user Student2 fred_ąć /ADD 
net localgroup "Użytkownicy" Student2 /add
net user Student3 fred_ąć /ADD 
net localgroup "Goście" Student3 /add
net user Student4 fred_ąć /ADD 
net localgroup "Administratorzy" Student4 /add
net user Student5 fred_ąć /ADD
net localgroup "Studenci" /add
net localgroup "Studenci" Student5 /add
