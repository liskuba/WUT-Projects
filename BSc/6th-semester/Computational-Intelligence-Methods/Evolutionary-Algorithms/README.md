# Części składowe projektu

## AE1: Implementacja algorytmu genetycznego – opt. f-cji kwadratowej w $\mathbb{R}^3$

Podstawowy algorytm genetyczny z mutacją gaussowską i krzyżowaniem jednopunktowym. Sprawdzenie działania algorytmu na funkcji $x^2+y^2+2z^2$ oraz na pięciowymiarowej funkcji Rastrigina.

## AE2: Wypełnianie koła prostokątami

Rozwiązanie wariantu problemu znanego w literaturze jako **cutting stock problem**.

Mamy dane koło o promieniu r oraz zbiór dostępnych prostokątów zadanych przez trzy liczby: wysokość, szerokość i wartość.

Celem jest ułożenie prostokątów w kole tak, aby zmaksymalizować sumę ich wartości, spełniając następujące warunki:

- boki wszystkich prostokątów są równoległe do osi układu,
- wnętrza prostokątów nie mają części wspólnej (intuicyjnie: prostokąty nie nachodzą na siebie, ale mogą się stykać bokami),
- każdy prostokąt można wstawić dowolnie wiele razy.

W ramach projektu zaproponowane jest kodowanie problemu, operator mutacji i krzyżowania i implementacja algorytmu genetyczny rozwiązującego powyższy problem.

Rozwiązanie testowane jest na danych znajdujących się w folderze cutting.

Struktura pliku: w nazwie pliku jest podany promień koła, plik jest w formacie csv: pierwsza kolumna to szerokość prostokąta, druga to wysokość, trzecia to wartość prostokąta.

