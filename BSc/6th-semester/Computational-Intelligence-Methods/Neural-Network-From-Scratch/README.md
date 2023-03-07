# Wstęp

Założeniem laboratorium było zapoznanie się z budową modelu perceptronu wielowarstwowego – sieci neuronowej typu feedforward.

Do implementacji używane są jedynie biblioteki takie jak na przykład numpy, realizujące działania macierzowe, a nieużywane są gotowe biblioteki implementujące sieć neruonową.

## Sprawozdanie (report.pdf)

Sprawozdanie zawiera:

- krótki opis tematu laboratoriów,
- opis wykonanej pracy i wyniki eksperymentów,
- wnioski na temat działania sieci na podstawie eksperymentów.

### NN1: Bazowa implementacja

Implementacja sieci neuronowej typu MLP, w której można ustawić: liczbę warstw, liczbę neuronów w każdej z warstw i wagi poszczególnych połączeń, w tym biasów. Sieć używa jedynie sigmoidalnej funkcji aktywacji. Na wyjściu dopuszczana jest funkcja liniowa.

Implementacja sieci została przygotowana w taki sposób, żeby łatwo zmieniać:

- architekturę, to znaczy liczbę wejść, wyjść, neuronów w warstwach ukrytych,
- funkcję aktywacji.

Przygotowaną implementacja wykorzystana została do rozwiązania zadania regresji na dostarczonych danych. Parametry sieci dobrane zostały ręcznie, tak aby uzyskać możliwie dobrze wyniki na zbiorach danych:

- square-simple
- steps-large

### NN2: Implementacja propagacji wstecznej błędu

Implementacja uczenia sieci neuronowej propagacją wsteczną błędu. Sprawdzenie implementacji odbyło się za pomocą uczenia na prostych danych dostarczonych na zajęciach. Następnie, implementacja metody wizualizacji wartości wag sieci w kolejnych iteracjach. Implementacja wersji z aktualizacją wag po prezentacji wszystkich wzorców i wersję z aktualizacją po prezentacji kolejnych porcji (batch).

Wagi inicjowane są z rozkładu jednostajnego na przedziale [0,1].

Uczenie sieci testowane było na następujących zbiorach:

- square-simple,
- steps-small,
- multimodal-large.

### NN3: Implementacja momentu i normalizacji gradientu

Implementacja dwóch usprawnień uczenia gradientowego sieci neuronowej:

- moment,
- normalizacja gradientu RMSProp.
Plik zawiera także porównanie szybkości zbieżności procesu uczenia dla obu wariantów.

Eksperymenty przeprowadzone na zbiorach:

- square-large,
- steps-large,
- multimodal-large.

### NN4: Rozwiązywanie zadania klasyfikacji

Implementacja funkcji softmax dla warstwy wyjściowej sieci neuronowej.

Przeprowadzić eksperymenty na zbiorach:

- rings3-regular,
- easy,
- xor3.

### NN5: Testowanie różnych funkcji aktywacji

Rozszerzenie poprzedniej implementacji sieci i metody uczącej o możliwość wyboru funkcji aktywacji:

- sigmoid,
- liniowa,
- tanh,
- ReLU.

Porównanie szybkości uczenia i skuteczności sieci w zależności od liczby neuronów w poszczególnych warstwach i rodzaju funkcji aktywacji. Sprawdzenie sieci z jedną, dwiema i trzema warstwami ukrytymi. Podobnie jak z implementacją funkcji softmax (NN4), należało dostosować proces uczenia do pochodnych nowych funkcji aktywacji.

### NN6: Zjawisko przeuczenia + regularyzacja

Implementacja mechanizmu regularyzacji wag w sieci oraz mechanizmu zatrzymywania uczenia przy wzroście błędu na zbiorze walidacyjnym.

Przeprowadzone zostały eksperymenty na zbiorach i porównana skuteczność na zbiorze testowym dla różnych wariantów przeciwdziałania przeuczeniu sieci:

- multimodal-sparse,
- rings5-sparse,
- rings3-balance,
- xor3-balance.
