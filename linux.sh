# ----------------------------------------------------------------------------------------------------
# Laboratorium
# Linux – praca w konsoli
# Manipulowanie plikami i katalogami
# ----------------------------------------------------------------------------------------------------

# 1. Wyświetlić zawartość swojego katalogu domowego tak aby:
# (a) pojawiły się wszystkie informacje na temat plików i katalogów;
l -all
# (b) wyświetlone zostały pliki i katalogi ukryte;
ls -all
# (c) wyświetlane elementy były posortowane wg rozmiaru;
ls -S
# (d) wyświetlane elementy były posortowane wg daty;
ls -lt
# (e) wyświetlone zostały tylko pliki o rozszerzeniu txt;
ls *.txt -all
# (f) wyświetlone zostały tylko pliki, które w swojej nazwie jako trzecią literę zawierająi.
ls ??i* -all

# 2. Wyświetlić zawartość bieżącego katalogu:
# (a) wykorzystując do tego celu polecenie more, które pobierze dane do wyświetlenia z polecenia ls poprzez łącze systemowe;
ls -a|more
# (b) zapamietaj wynik wykonania operacji lsw pliku wynik.dat.
ls -a|more > wynik.dat

# 3. Stworzyć w katalogu katalog miękki link do pliku plik.txt. Sprawdzić w jaki sposób link ten 
# jest wyświetlany przez polecenie ls oraz dokonać próby modyfikacji tego pliku poprzez stworzony link.
ln plik.txt linkDoPliku
# wyświetla się:
# linkDoPliku -> plik.txt

# 4. Korzystając z polecenia cat stworzyć dwa pliki dane1.dat oraz dane2.dat a nastepnie połączyć oba pliki w jeden pod nazwą dane3.dat.
cat > dane1.dat # <wpisujemy tekst po enterze, następnie ctrl + Z>
cat > dane2.dat # <wpisujemy tekst po enterze, następnie ctrl + Z>
cat dane1.dat dane2.dat > dane3.dat

# 5. Przy użyciu polecenia file sprawdzić jakie informacje zostaną wyświetlone o pliku
# plik.txt a jakie o linku do tego pliku
file plik.txt     # plik.txt: ASCII text
file linkDoPliku  # linkDoPliku: ASCII text

# 6.Za pomocą polecenia diff porównać pliki dane3.dat oraz dane3.dat.
diff dane2.dat dane3.dat

# 7. Przeszukaj (polecenie find) swoje konto w poszukiwaniu:
# (a) wszystkich plików z rozszerzeniem dat;
find *.dat
# (b) wszystkich plików, które w swojej nazwie mają jako drugą literę a lub i;
find ?[a,i]*
# (c) wszystkich plików, których zawartość zmieniła się w ciągu ostatnich 5 minut;
find -mtime -5
# (d) wszystkich plików, których zawartość zmieniła się 10 lub więcej minut temu a dodatkowoich nazwy zaczynają się na literę p;
find -mtime +10
# (e) wszystkich plików, które maja prawa 644.
find -perm 664

# 8. Sprawdzić pełną nazwę (bezwzględną ścieżkę dostępu) do katalogu domowego.
echo ~

# 9. Przejść do katalogu domowego, utworzyć za pomocą jednego polecenia następującą 
# gałąź podkatalogów: zajecia/zadania/lab4.
cd ~
mkdir -p ~/zajecia/zadania/lab4

# 10. Sprawdzić działanie poleceń basename i dirname w następujący sposob:
# (a) napisać polecenie: echo $HISTFILE. Co jest jego wynikiem?
echo $HISTFILE # pokazuje lokalizację pliku historii poleceń = /home/student/.bash_history
# (b) napisać polecenia: basename $HISTFILE i dirname $HISTFILE.
basename $HISTFILE # nazwa pliku historii poleceń = .bash_history
dirname $HISTFILE # nazwa katalogu w którym znajduje się plik historii poleceń = home/student

# 11. Wyświetlić listę plików w katalogu domowym, uporządkowaną według czasu 
# tworzenia plików, ale w kolejnosci odwrotnej,

# modyfikacji plików ale w kolejnosci odwrotnej.
ls -ltX

# 12. Wyświetlić listę plików w katalogu domowym w formacie wielokolumnowym opatrzonym specjalnymi znakami, 
# tj. / dla katalogow, * dla plików wykonywalnych, @ dla linków, itd. 
# (wykorzystać jedną z opcji polecenia ls).
ls -F --classify  --format long

# 13. Za pomocą polecenia echo "napis" > nazwa_pliku utworzyć pliki testowe test1, test2 i test3, założyć katalog tmp i skopiować do niego te pliki.

# 14. Usunąć pliki testowe (z katalogu domowego) poleceniem rm bez opcji.

# 15. Usunąć pliki testowe (z katalogu tmp) przy pomocy polecenia rm z opcjami powodującymi odpytanie użytkownika o zgodę.

# 16. Utworzyć link symbolicznyo nazwie zu wskazującynakatalog ~/zadania/unix,sprawdzić wynik polecenia cd zu. Uwaga! Najpierw należy utworzyc w/w katalog.

# 17. Utworzyć katalog test2. 
# Przy pomocy polecenia touch nazwa_pliku nazwa_pliku2 ...
# utworzyc w nim pliki ala.test, bela.test, cela.test, dela.test i mela.test. 
# Utworzyć w katalogu domowym link symboliczny a_sym wskazujący na plik ala.test i link twardy a_szt wskazujący na ten sam plik. 
# Zbadać właściwości linków (np. dopisać coś do treści pliku lub skasować plik wskazywany przez linki).

# 18. Skasować jednym poleceniem pliki: bela.test, cela.test, dela.test, ale nie mela.test.

# 19. Zapisać listing pełny katalogu /bin do pliku zad_lab4.

# 20. Wyświetlić 10 pierwszych linii pliku zad_lab4.

# 21. Wyświetlić 15 ostatnich linii pliku zad_lab4.

# 22. Wyświetlić 10 ostatnich linii pliku zad_lab4 w odwrotnej kolejności.

# 23. Utworzyć plik tekstowy o nazwie .profile. Wpisac w nim linię: alias rm=’rm -i’. Wylogować się i zalogować ponownie w celu uruchomienia ustawień zawartych w pliku startowym .profile. Odpowiedzieć na pytania:
# (a) do czego sluzy plik .profile? 
# (b) czy celowe jest wpisanie do tego pliku linii alias rm=’rm -i’?

# 24. Przeglądnąć zawartość plików .bash profile oraz .bash logout, które odpowiednio wykonują się przy logowaniu oraz przy wyjściu z konta. Zmodyﬁkować tak te pliki aby przy logowaniu pojawiał się komunikat powitalny a przy wyjściu komunikat pożegnalny.

# 25. Posortować plik dane3.dat:
# (a) rosnąco; 
# (b) malejąco; 
# (c) rosnąco według trzeciej litery wiersza.

# 26. Korzystając z polecenia grep wyświetlić z pliku dane3.dat:
# (a) wszystkie linie zawierające cyfry;
# (b) wszystkie linie zawierające literę a; 
# (c) wszystkie linie zawierające litery od a do h; 
# (d) wszystkie linie nie zawierające cyfr i zapamiętać je w pliku filtr1.dat.

# 27. Za pomocą polecenia dd zamienić wszystkie male litery w pliku filtr1.dat na litery duże.

# 28. Wyświetlić nazwy wszystkich plików w katalogu domowym użytkownika, nie modyﬁkowanych od 7 dni.

# 29. Odszukać wszystke pliki *.c położone w katalogu domowym użytkownika, a następnie wykorzystując wyrażenie pierwotne -exec wypisać ich listę w długim formacie. Uwaga: jeśli w katalogu nie ma plików z rozszerzeniem .c, należy kilka utworzyć.

# 30. Odszukać w katalogu /tmp wszystkie pliki *.txt mniejsze niż 1000 bajtow i wyświetlić o nich informacje w długim formacie.

# 31. Wyświetlić nazwy i zawartość plików *.txt we własnym katalogu domowym. Jeśli nie ma takich plików, należy wcześniej utworzyć dwa pliki tekstowe: test1.txt i test2.txt.
