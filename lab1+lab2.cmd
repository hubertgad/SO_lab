@echo off
REM ----------------------------------------------------------------------------------------------------
REM 						LAB 1
REM ----------------------------------------------------------------------------------------------------

REM 1. Zapoznać się z możliwościami konﬁguracji okna Wiersza polecenia.
REM (a) Zmień tytuł okna wiersza polecenia na Systemy operacyjne - laboratorium. 
REM (b) Zmień kolor tla wiersza polecenia na niebieski, a kolor czcionki na żółty.
title "Systemy operacyjne - laboratorium" & color 16

REM 3. Wyswietl godzine i date bez monitu o zmiane daty.
date /t & time /t

REM 4. Sporzadz raport stanu dysku i umiesc go w pliku raport_dysk.
chkdsk > raport_dysku.txt

REM 5. Napisz instrukcje, która spowoduje wyswietlenie na ekranie zawartosci pliku raport_dysk.
TYPE raport_dysku.txt

REM 6. Napisac instrukcje, która wyswietli wszystkie pliki z katalogu głównego na dysku c.
DIR /A C: /A-D

REM 7. Napisac instrukcje, która wyswietli wszystkie katalogi w katalogu głównym na dysku c.
DIR /A C: /A:D

REM 8. Wyswietlic wszystkie pliki z katalogu system32 w kolejnosci alfabetycznej według rozszerzenia.
DIR /A %systemroot%\system32 /O:E

REM 9. Napisac polecenie, które skopiuje wszystkie pliki z katalogu nadrzednego wzgledem biezacego do katalogu biezacego. Kopiowanie powinno odbyc sie z weryfikacja danych.
COPY .. /V

REM 10. Utworzyc katalogi KAT1 i KAT2. Do katalogu Kat2 skopiowac pliki z katalogu system32, których druga litera nazwy jest d.
MKDIR KAT1 & MKDIR KAT2
COPY %SYSTEMROOT%\system32\?d*.* KAT1

REM 11. Napisac instrukcje, która spowoduje usuniecie pustego katalogu o nazwie KAT1.
DEL KAT1 /Q

REM 12. Napisac instrukcje, która spowoduje usuniecie niepustego katalogu o nazwie KAT2.
DET KAT2 /S

REM 13. Utworzyc plik o nazwie dane.h i nadac mu atrybut ukryty. Sprawdzic poleceniem dir, czy jest widoczny.
NULL > C:\dane.h
ATTRIB +H C:\dane.h
DIR C:\dane.h

REM 14. Napisac polecenie, które utworzy plik o nazwie dane.txt oraz umozliwi wpisanie 
REM do niego ciagu znaków z poziomu wiersza polecenia. 
REM UWAGA! Wykorzystac polecenie copy. Koniec wpisywania znaków do pliku zasygnalizowac sekwencja ctrl+Z.
COPY con > file.txt

REM 15. Zmienic znak zachety na biezaca godzine zakonczona znakiem wiekszosci.
PROMPT $T $G

REM 16. Zapoznac sie z poleceniami: if, for, call, goto.

REM 17. Utworzyc plik wsadowy, który usunie wszystkie pliki o rozszerzeniu .bak i .tmp z katalogu
REM podanego jako parametr. Skrypt powinien sprawdzac czy podano parametr. 
REM Jesli go nie podano, to na ekranie powinna zostac wydrukowana poprawna składnia uzycia polecenia.
IF [%1] NEQ [] (
DEL %1\*.bak % DEL %1\*.tmp
) ELSE (
ECHO Podaj sciezke do katalogu! )

REM 18. Zmodyfikowac skrypt z zadania poprzedniego tak, aby maski plików do usuniecia były podawane z linii polecen. 
REM Rozwazyc mozliwosc podania wiecej jak jednego parametru.
IF [%1] EQU [] (
ECHO Podaj sciezke do katalogu!
GOTO :EOF )
:LAB
IF [%2] NEQ [] (
DEL %1\*.%2
SHIFT
GOTO :LAB )

REM 19. Napisac program wsadowy, który spowoduje wyswietlenie na ekranie nazwy zalogowanego uzytkownika,
REM litere dysku oraz nazwe katalogu macierzystego oraz informacje o procesorze znajdujacym sie w systemie.
ECHO %USERNAME%
ECHO %HOMEDRIVE%
ECHO %HOMEPATH%
ECHO %PROCESSOR_ARCHITECTURE% %PROCESOR_LEVEL%

REM 20. Dodać zadanie do harmonogramu zadań, polegające na uruchomieniu programu defragmentator dysku w wybranym dniu o wybranej godzinie
schtasks /create /tr defrag /tn nazwa /sc ONCE /st 15:00 

REM 21. Napisać skrypt wypisujący na ekranie liczby całkowite z danego przedziału podanego z lini poleceń.
FOR /L %%G IN (%1, 1, %2) DO (echo %G)

REM 22. Napisać skrypt który zamieni rozszerzenia wszystkich plików *.txt na *.tx_. Rozszerzyć funkcjonalność skryptu o podawanie rozszerzeń jako parametry skryptu.
REM RENAME *.txt *tx_ - wersja pierwsza
RENAME *.%1 *.%2

REM 23. Wyświetlić na ekranie listę otwartych udostępnionych plików oraz ich blokady.
net file

REM 24. Wyświetlić listę połączeń sieciowych komputera.
netstat

REM 25. Uruchomić program notatnik z priorytetem czasu rzeczywistego.
start /realtime notepad

REM 27. Przeanalizować potrzebę wykonania defragmentacji dysku twardego.
defrag /C /A /V

REM 28. Zaplanować automatyczne wyłączenie oraz ponowne uruchomienie komputera.
schtasks /create /tn Shut-Down /sc ONCE /st 15:00 /tr "shutdown -s"
schtasks /create /tn Shut-Down /sc ONCE /st 16:00 /tr "shutdown -r"

REM 29. Napisać grę zgadywankę, o następującym działaniu:
REM - komputer losuje liczbę całkowitą z zakresu od 0 do 100,
REM - użytkownik próbuje zgadnąć tę liczbę mając 6 prób,
REM - po nieudanej próbie komputer informuje gracza czy podana przez niego liczba była za duża czy za mała,
REM - gracz wygrywa gdy uda mu się zgadnąć liczbę.
echo Wylosuje teraz liczbe z zakresu od 1 do 100.
set /a x = %random% % 100
set l=6
set /p y="Odgadnij, jaka liczbe wylosowalem: "
:label
set /a l=l-1
IF %x% EQU %y% DO (
  echo  Gratulacje! WYGRALES!
) ELSE (
  echo  Przykro  mi.
  IF %l% EQU 0 (
    echo  Przegrales.
    GOTO :EOF )
  echo  Sprobuj ponownie. Liczba prob, ktore Ci pozostaly: %l% )
  echo ------------------------------------------------------------
  GOTO :label )
 pause

REM 30. Napisać skrypt kalkulator o następującym działaniu:
REM - kalkulator wykonuje działania na liczbach całkowitych,
REM - kalkulator obsługuje operacje: +, -, /, *,
REM - argumenty oraz operator mają zostać podane z klawiatury poprzez dialog ze skryptem,
REM - kalkulator powinien kontrolować operację dzielenia przez zero.
  :start
pause
cls
echo Wybierz dzialanie:
echo 1 - Dodawanie
echo 2 - Odejmowanie
echo 3 - Mnozenie
echo 4 - Dzielenie
echo 5 - Wyjscie
set /P wybor=Wybor: 
IF %wybor% EQU 5 (GOTO :E)
set /P x1=Pierwsza liczba:
set /P x2=Druga liczba:
IF %wybor% EQU 1 (GOTO :A)
IF %wybor% EQU 2 (GOTO :B)
IF %wybor% EQU 3 (GOTO :C)
IF %wybor% EQU 4 (GOTO :D)
  :A
set /A odp=x1+x2
echo          %x1% + %x2% = %odp%
GOTO :start
  :B
set /A odp=x1-x2
echo          %x1% - %x2% = %odp%
GOTO :start
  :C
set /A odp=x1*x2
echo          %x1% * %x2% = %odp%
GOTO :start
  :D
IF %x2% EQU 0 (
echo Blad! Dzielenie przez 0!
GOTO :start )
set /A odp=x1/x2
echo          %x1% / %x2% = %odp%
GOTO :start
  :E
echo Koniec...
pause

REM 30. Napisać skrypt kalkulator o następującym działaniu:
REM - kalkulator wykonuje działania na liczbach całkowitych,
REM - kalkulator obsługuje operacje: +, -, /, *,
REM - argumenty oraz operator mają zostać podane z klawiatury poprzez dialog ze skryptem,
REM - kalkulator powinien kontrolować operację dzielenia przez zero.
IF "%2"=="/" (
	IF "%3"=="0" GOTO :0ERROR
	)
set /A odp=%1%2%3
echo ---
echo 		%1 %2 %3 = %odp%
echo ---
GOTO :EOF
:0ERROR
echo Blad. Nie mozna dzielic przez 0.

REM 32. Napisać skrypt, który będzie podawał status wyjścia aplikacji uruchomionej przez skrypt.
REM Skrypt ma zapytać się użytkownika o nazwę aplikacji, którą ma uruchomić.
SET /p nazwa = Podaj nazwe aplikacji, ktora mam uruchomic: 
CALL %nazwa%
ECHO Aplikacja zakonczona z kodem %ERRORLEVEL%.

REM ----------------------------------------------------------------------------------------------------
REM 						LAB 2
REM ----------------------------------------------------------------------------------------------------

@echo off
REM 1. Sprawdź w linii poleceń istniejące konta i grupy użytkowników? Użyj polecenia z grupy net.
net user

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

REM 3. Usuń założone grupy i użytkowników z linii poleceń. Sprawdź czy operacje usunięcia się powiodły.
FOR /L %%G IN (1, 1, 5) DO (net user Student%%G /delete)
net localgroup "Studenci" /delete

REM 4. Jakim poleceniem z linii komend można otworzyć program Zarządzanie komputerem?
compmgmt.msc

REM 5. Z linii poleceń otwórz program Zasady zabezpieczeń lokalnych:
REM (a) Przejdź do folderu Ustawienia zabezpieczeń\Zasady konta\Zasady haseł
REM (b) Przejrzyj wszystkie opcje i zapoznaj się z kartą Wyjaśnienie.
REM (c) Włączyć opcje dotyczące komplikacji hasła, długość min 8 znaków oraz ważność hasła ustawić na 14 dni. Sprawdzić czy można podać hasło nie spełniające powyższych wymagań.
REM 6. Otwórz ponownie program Zasady zabezpieczeń lokalnych:
REM (a) Przejdź do folderu Ustawienia zabezpieczeń\Zasady konta\Zasady blokady konta
REM (b) Przejrzyj wszystkie opcje i zapoznaj się z kartą Wyjaśnienie.
REM (c) Włączyć opcje blokady konta tak, aby było blokowane na jedną minutę po wprowadzeniu trzech błędnych haseł. Dokonać sprawdzenia włączonych mechanizmów.
secpol.msc

REM 7. Jako administrator utwórz konto o nazwie Jan i przypisz mu folder macierzysty w następującej lokalizacji: 
REM C:\Foldery_macierzyste\Jan
MKDIR C:\Foldery_macierzyste\Jan
NET USER Jan * /HOMEDIR:C:\Foldery_macierzyste\Jan /ADD

REM 8. Przejdź do właściwości konta Jan i przetestuj wszystkie możliwe scenariusze ustalania przez administratora zasad dotyczących hasła:
REM (a) Użytkownik musi zmienić hasło przy następnym logowaniu,
REM (b) Użytkownik nie może zmienić hasła,
REM (c) Hasło nigdy nie wygasa.
REM Sprawdź jak te zasady działają logując sie na konto Jan po każdej zmianie zasady/zasad.
REM https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771865(v%3Dws.11)
net user Jan /logonpasswordchg:yes
net user Jan /passwordchg:no
wmic useraccount WHERE name="Jan" SET passwordexpires=false

REM 9. Sprawdź kiedy ostatnio logował się użytkownik Jan na swoje konto? Podaj dokładną datę i godzinę logowania.
REM wmic user netlogin WHERE name="Jan" get LastLogon /all

REM 10. Wyświetlić wszystkie informacje na temat użytkownika, którego nazwę należy podać jako parametr wejściowy do skryptu.
net user %1

REM 11. Napisać polecenie, które spowoduje dodanie do systemu użytkownika o podanej nazwie, 
REM który będzie mógł się zalogować jedynie w dni robocze, w godzinach od 8 do 15.
net user Jan /times:Pn-Pt,8-15

REM 12. Napisać polecenie które ustawi minimalną długość hasła na 10 znaków.
net accounts /minpwlen:10

REM 13. Napisać polecenie, które ustawi ważność hasła na 5 dni. Po upływie 5 dni wymuszona zostanie zmiana hasła.
net accounts /maxpwage:5

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

REM 15. Prawa dostępu do zasobów. Wykonaj działania:
REM (a) Utworzyć trzech użytkowników o nazwach Student1, Student2, Student3.
REM (b) Utworzyć dwie grupy o nazwach Grupa1 i Grupa2.
REM (c) Do grupy Grupa1 przypisać użytkowników Student1 i Student2.
REM (d) Do grupy Grupa2 przypisać użytkowników Student2 i Student3.
REM (e) Utworzyć na dysku folder o nazwie C:\dane_grup.
REM (f) Zapoznaj się z poleceniem icacls.
REM (g) Z poziomu linii poleceń odczytaj właściwości folderu C:\dane_grup.
REM (h) Przypisać uprawnienia domyślne wraz z prawem Zapis do folderu Dane_grup grupie Grupa1.
REM (i) Przypisać grupie Grupa2 prawa Wyświetlanie zawartości folderu oraz Odczyt i odmówić prawa Zapis1.
REM (j) Sprawdzić jakie są czynne uprawnienia poszczególnych użytkowników? 
REM Zwróć szczególną uwagę na użytkownika Student2 jakie będzie miał uprawnienia. Wypisz je.
NET USER Student1 /ADD
NET USER Student2 /ADD
NET USER Student3 /ADD
NET LOCALGROUP Grupa1 /ADD
NET LOCALGROUP Grupa2 /ADD
NET LOCALGROUP Grupa1 Student1 /ADD
NET LOCALGROUP Grupa1 Student2 /ADD
NET LOCALGROUP Grupa2 Student2 /ADD
NET LOCALGROUP Grupa2 Student3 /ADD
MKDIR "C:\dane_grup"
ICACLS /h
ICACLS C:\dane_grup
ICACLS C:\dane_grup /grant "Grupa1:W"
ICACLS C:\dane_grup /grant "Grupa2:(RD,R)" /deny "Grupa2:W"

REM 16. Napisać skrypt, który nada określone prawa dostępu danemu użytkownikowi do danego zasobu.
REM Wszystkie potrzebne dane powinny być podane jako parametry skryptu.
REM %1 - katalog 
REM %2 - nazwa użytkownika 
REM %3 - uprawnienie
:LAB1
IF [%3] NEQ [] (
ICACLS %1 /grant %2:%3
SHIFT /3
GOTO :LAB1)

REM 17. Zalogować się jako administrator. Utworzyć folder C:\dane_admina. 
REM Nadaj użytkownikowi admin prawo Pełna kontrola do tego folderu i utworzyć wewnątrz niego plik plik_admina.txt o dowolnej treści.
MKDIR "C:\dane_admina"
ICACLS "C:\dane_admina" /grant "admin:F"
ECHO dowolna_treść > C:\dane_admina\plik_admina.txt

REM 18. Zalogować się odpowiednio jako Student1, Student2 oraz Student3 i wykonać na pliku plik_admina.txt operacje:
REM otwarcia, zmiany zawartości, zapisu, usunięcia. 
REM Wykonanie których operacji jest możliwe?
REM wszystkie ??

REM 19. Za poznaj się z poleceniem takeown.

REM Enables an administrator to recover access to a file that previously was denied, by making the administrator the owner of the file.
REM takeown [/s <Computer> [/u [<Domain>\]<User name> [/p [<Password>]]]] /f <File name> [/a] [/r [/d {Y|N}]]

REM 20. Zapoznać się z programem diskpart. Za jego pomocą wyświetlić
REM (a) szczegółowe informacje o dostępnych dyskach, wolumenach i partycjach
REM (b) nazwy partycji oraz ich rozmiary
diskpart 
list disk
list volume
select disk 0
list partition

REM 21. Zapoznać się z poleceniem fsutil.
REM Zwrócić uwagę na właściwą kolumnę.

REM Performs tasks that are related to file allocation table (FAT) and NTFS file systems, 
REM such as managing reparse points, managing sparse files, or dismounting a volume. 
REM If it is used without parameters, Fsutil displays a list of supported subcommands.

REM 22. Wpisać w linii poleceń następujące polecenie: fsutil fsinfo volumeinfo C: 
REM i sprawdzić czy dysk obsługuje przydziały dyskowe.
.............

REM 23. Sprawdzić jakie są obecnie ustawione limity przydziałów: fsutil quota query C:.
REM Następnie ustawić użytkownikowi Student1 limity na 60 MB (poziom ostrzeżeń, w bajtach: 62914560 = 60·220) 
REM i 100 MB (limit końcowy, w bajtach: 104857600 = 100·220).
REM Ponownie sprawdzić ustawienia linitu przydziałów.
REM Następnie zmienić limity na 80 MB (83886080 B, poziom ostrzeżeń) i 120MB (125829120 B, limit końcowy).
fsutil quota query C:
fsutil quota modify 62914560 104857600 Student1
fsutil quota query C:
fsutil quota modify 83886080 125829120 Student1

REM 24. Zaloguj się na konto Student1. Uruchom notatnik i napisz w nim dowolny tekst bez zapisywania go. Notatnik pozostaw uruchomiony.
REM • Podaj jaki masz SID2
REM .
REM • Przeloguj się na konto administratora (bez wylogowywania).

REM 25. Zapoznaj się z poleceniem query, a w szczególności z user i session.
REM (a) Sprawdź ilu obecnie użytkowników jest zalogowanych w systemie?
REM (b) Sprawdź jaki numer identyfikacyjny (ID) ma sesja administratora i użytkownika Student1, godzinę logowania, nazwę sesji oraz stan.
REM (c) Porównaj wyniki z tym co prezentuje Menedżer zadań w trybie graficznym. 
REM Podaj także jakim poleceniem można uruchomić Menedżera zadań?
QUERY user

REM 26. Zapoznaj sie z poleceniem query process oraz uruchom notatnik.
REM (a) Wyświetl osobno procesy dla administratora i użytkownika Student1.
REM (b) Wyświetl procesy, które są obecnie używane w sesji o nazwie console.
REM (c) Wyświetl procesy, które są skojarzone z notatnikiem. Zwróć uwagę na PID procesu i z jakim użytkownikiem i sesją są skojarzone.
REM (d) Zadanie domowe: wyjaśnij pojęcie PID.
REM (e) Porównaj wyniki z tym co prezentuje Menedżer zadań w trybie graficznym.

REM 27. Zapoznaj się z poleceniem tasklist. Wykonaj podpunkty (a)-(c) z zadania 26. 
REM Wskaż, czy są różnice w wynikach, czy jest ich tyle samo, jak są wyświetlane? 
REM Porównaj wyniki z uzyskanymi w poprzednich zadaniach.

REM 28. Jako administrator z poziomu Menedżera zadań zakończ pracę notatnika.

REM 29. Będąc zalogowanym na koncie administratora i korzystając z polecenia query, tasklist, tskill
REM lub taskkill zakończ działanie notatnika dla konta Student1 (zwróć uwagę, że notatnik pozostał uruchomiony z niezapisanym tekstem).

REM 30. Korzystając z programu Podgląd zdarzeń określ przybliżony czas ostatniego uruchomienia komputera.
eventvwr.msc

REM 31. Zapoznaj się z poleceniem systeminfo i porównaj czasy uruchomienia komputera.
:: Wyświetla szczegółowe informacje o komputerze oraz OS:
:: konfiguracja OS, informacje o bezpieczeństwie, ID produktu,
:: konfiguracja sprzętu (RAM, dysk, sieć).

REM 32. Dokonaj inspekcji zdarzeń logowania na kontach. Do dziennika bezpieczeństwa należy zapisywaćzdarzenia Sukces jak i Niepowodzenie.
REM Wskazówka: użyj polecenia secpol.msc.

REM 33. Otwórz plik zawierający dziennik bezpieczeństwa i określ informacje dotyczące pierwszego zdarzenia.

REM 34. Zapoznaj się z poleceniem gpresult.

REM 35. Wyświetl raport zawierający zasady wynikowe dla użytkownika Student1.
REM https://msdn.microsoft.com/en-us/library/windows/desktop/aa379649(v=vs.85).aspx,
REM http://technet.microsoft.com/en-us/library/cc778824(WS.10).aspx

REM 36. Wyświetl raport zawierający zasady wynikowe dla komputera.

REM 37. Wygeneruj raport w postaci pliku c:\raport\student1.html

