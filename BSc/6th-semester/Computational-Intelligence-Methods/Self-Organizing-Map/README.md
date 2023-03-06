# Wstęp

Projekt polegał na zaimplementowaniu sieci Kohonena (Self Organizing Map), a następnie zastosowaniu jej do dwóch zbiorów obrazków: MNIST i notMNIST (bez etykiet). Sprawozdanie (raport) zawiera wnioski na temat mapowań otrzymanych z użyciem sieci Kohonena.

# Projekt

## KOH1: Podstawowa sieć Kohonena

Implementacja Sieci Kohonena złożona z neuronów w prostokątnej siatce M×N (M, N są parametrami programu), która działa dla zbioru wektorów (wszystkich o tej samej długości).

Implementacja posiada następujące funkcje sąsiedztwa:

- funkcję gaussowską
- minus druga pochodną funkcji gaussowskiej.

W obu implementacjach jest możliwość zmiany szerokości sąsiedztwa z użyciem parametru (technicznie oznacza to przemnożenie argumentu x przez stałą).

Jako funkcji wygaszającej uczenie wraz z kolejnymi iteracjami użyto funkcji α(t)=e−t/λ

Działanie sieci na przetestowane zostało na zbiorach danych:

- danych 2d skupionych w wierzchołkach sześciokąta (hexagon.csv),
- danych 3d skupionych w wierzchołkach sześcianu (cube.csv).

## KOH2: Sieć Kohonena na siatce sześciokątnej

Do implementacji KOH1 dodana możliwość ułożenia neuronów w topologii siatki sześciokątnej.

Oba warianty topologii i obie funkcje sąsiedztwa zastosowane zostały do wektorów danych ze zbiorów

MNIST
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
(sieć Kohonena uruchamiana na zbiorach bez etykiet).

Przeanalizowane otrzymane mapowanie danych jest z uwzględnieniem etykiety danych.
