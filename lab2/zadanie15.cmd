@echo off
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
