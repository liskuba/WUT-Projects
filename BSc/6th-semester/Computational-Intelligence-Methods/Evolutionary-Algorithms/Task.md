# Wstęp

Ta część laboratorium jest zaplanowana do końca semestru. W ramach pierwszych trzech zajęć należy zaimplementować algorytm genetyczny optymalizujący wartość funkcji w przestrzeni $R^n$.

W drugiej części należy zaimplementować NEAT. Podejście, które buduje strukturę sieci neuronowej rozwiązującej zadany problem klasyfikacji/regresji. W tym przypadku przestrzeń genotypów jest bardziej złożona niż $R^n$ i wymaga stosowania dużo bardziej skomplikowanych operatorów mutacji i krzyżowania.

# Laboratoria

## AE1: Implementacja algorytmu genetycznego – opt. f-cji kwadratowej w R³ (1 tydzień, bez punktów)

Napisać podstawowy algorytm genetyczny z mutacją gaussowską i krzyżowaniem jednopunktowym. Sprawdzić działanie algorytmu na funkcji $x^2+y^2+2z^2$ oraz na pięciowymiarowej funkcji Rastrigina.

## AE2: Wypełnianie koła prostokątami (2 tygodnie, 6 punktów, uwaga na podział punktów na terminy!!)

Rozwiązać wariant problemu znanego w literaturze jako cutting stock problem.

Mamy dane koło o promieniu r oraz zbiór dostępnych prostokątów zadanych przez trzy liczby: wysokość, szerokość i wartość.

Celem jest ułożenie prostokątów w kole tak, aby zmaksymalizować sumę ich wartości, spełniając następujące warunki:

boki wszystkich prostokątów były równoległe do osi układu,
wnętrza prostokątów nie miały części wspólnej (intuicyjnie: prostokąty nie nachodzą na siebie, ale mogą się stykać bokami),
każdy prostokąt można wstawić dowolnie wiele razy.
Zaproponować kodowanie problemu, operator mutacji i krzyżowania i zaimplementować algorytm genetyczny rozwiązujący powyższy problem.

Przetestować rozwiązanie na danych dostarczonych w pliku http://pages.mini.pw.edu.pl/~karwowskij/mioad/cutting.tar.xz.

Struktura pliku: w nazwie pliku jest podany promień koła, plik jest w formacie csv: pierwsza kolumna to szerokość prostokąta, druga to wysokość, trzecia to wartość prostokąta.

### AE2a: Po pierwszym tygodniu termin konsultacyjny, 2pkt

Należy omówić z prowadzącym swoją koncepcję rozwiązania, w tym kodowanie rozwiązań.

### AE2b: Po drugim tygodniu oddanie wyników, 4 pkt

Minimalny wynik na 4 punkty to przynajmniej wartość sumaryczna prostokątów 30000 w kole o średnicy 800 oraz 30000 w kole o średnicy 1200, minimum 17500 w kole o średnicy 1000 oraz minimum 25000 w kole o średnicy 1100. Zbiór r850 nie wpływa na punktację, ale należy zaprezentować wynik dla niego.

## AE3: Optymalizacja wag w sieci MLP z użyciem algorytmu genetycznego (1 tydzień, bez punktów, bo sprawozdanie)

Zaimplementować proste uczenie MLP z użyciem algorytmu genetycznego. Na wejściu jest: struktura sieci neuronowej i dane uczące. Optymalizowana funkcja to funkcja przekształcająca wektor wag sieci na błąd na zbiorze uczącym. Zastosować standardowe operatory krzyżowania i mutacji.

Przeprowadzić uczenie na zbiorach:

iris https://archive.ics.uci.edu/ml/datasets/Iris
multimodal-large (z części laboratorium o sieciach neuronowych)
auto-mpg (przewidzieć wartość mpg) - http://archive.ics.uci.edu/ml/datasets/Auto+MPG

Author: Jan Karwowski
