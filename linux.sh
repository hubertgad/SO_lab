# ----------------------------------------------------------------------------------------------------
# Laboratorium
# Linux – praca w konsoli
# Manipulowanie plikami i katalogami
# ----------------------------------------------------------------------------------------------------

# 1. Wyświetlić zawartość swojego katalogu domowego tak aby:
# (a) pojawiły się wszystkie informacje na temat plików i katalogów;
ls -all
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

# 4. Korzystając z polecenia cat stworzyć dwa pliki dane1.dat oraz dane2.dat a nastepnie połączyćoba pliki w jeden pod nazwą dane3.dat.
