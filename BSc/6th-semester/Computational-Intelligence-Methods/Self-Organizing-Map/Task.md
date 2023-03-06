# Wstęp

Ta część laboratorium jest zaplanowana tylko na dwa tygodnie, program do napisania jest bardzo krótki, są tylko dwa zbiory danych, na których należy przeprowadzić eksperymenty.

W ramach laboratorium należy zaimplementować sieć Kohonena, a następnie zastosować ją do dwóch zbiorów obrazków: MNIST i notMNIST (bez etykiet). Na koniec należy w sprawozdaniu opisać wniosku na temat mapowań otrzymanych z użyciem sieci Kohonena.

# Laboratoria

## KOH1: Podstawowa sieć Kohonena (2 tygodnie, 2 punkty)

Zaimplementować sieć Kohonena złożoną z neuronów w prostokątnej siatce M×N (M,N są parametrami programu), która działa dla zbioru wektorów (wszystkich o tej samej długości).

Zaimplementować następujące funkcje sąsiedztwa:

funkcję gaussowską
minus druga pochodną funkcji gaussowskiej.
W obu implementacjach dodać możliwość zmiany szerokości sąsiedztwa z użyciem parametru (technicznie oznacza to przemnożenie argumentu x przez stałą) i sprawdzić dla kilku wartości z przedziału [0.1,1]

Jako funkcji wygaszającą uczenie wraz z kolejnymi iteracjami użyć funkcji α(t)=e−t/λ

Przetestować działanie sieci na dostarczonych prostych zbiorach danych:

danych 2d skupionych w wierzchołkach sześciokąta,
danych 3d skupionych w wierzchołkach sześcianu.
Dane, odpowiednio hexagon i cube, mają 3/4 kolumny. Do sieci podać tylko kolumny x, y i z (w przypadku sześciokąta bez z). Ostatnia kolumna, c, zawiera identyfikator wierzchołka bryły/figury. Czy klastry w odwzorowaniu znalezionym przez sieć pokrywają się w liczbą klastrów w faktycznych danych? Czy znalezione klastry pokrywają się z identyfikatorami wierzchołków?

## KOH2: Sieć Kohonena na siatce sześciokątnej (1 tydzień, bez punktów, sprawozdanie po tym tygodniu)

Do implementacji z zeszłego tygodnia dodać możliwość ułożenia neuronów w topologii siatki sześciokątnej.

Zastosować oba warianty topologii i obie funkcje sąsiedztwa do wektorów danych ze zbiorów

MNIST
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
(sieć Kohonena uruchomić na zbiorach bez etykiet!).

Przeanalizować otrzymane mapowanie danych uwzględniając etykiety danych. Jak dobrze znalezione klastry odpowiadają podziałowi na klasy?

Author: Jan Karwowski
