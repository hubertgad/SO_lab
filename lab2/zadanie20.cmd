@echo off
REM 20. Zapoznać się z programem diskpart. Za jego pomocą wyświetlić
REM (a) szczegółowe informacje o dostępnych dyskach, wolumenach i partycjach
REM (b) nazwy partycji oraz ich rozmiary

diskpart 
list disk
list volume

select disk 0
list partition
