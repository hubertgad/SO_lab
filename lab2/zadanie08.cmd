@echo off
REM 8. Przejdź do właściwości konta Jan i przetestuj wszystkie możliwe scenariusze ustalania przez administratora zasad dotyczących hasła:
REM (a) Użytkownik musi zmienić hasło przy następnym logowaniu,
REM (b) Użytkownik nie może zmienić hasła,
REM (c) Hasło nigdy nie wygasa.
REM Sprawdź jak te zasady działają logując sie na konto Jan po każdej zmianie zasady/zasad.
REM https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771865(v%3Dws.11)

net user Jan /logonpasswordchg:yes
net user Jan /passwordchg:no
wmic useraccount WHERE name="Jan" SET passwordexpires=false
