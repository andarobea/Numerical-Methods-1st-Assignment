# Tema 1 Metode Numerice

## Task 1: Detectia anomaliilor

### function [mean_values variances] = estimate_gaussian(X)

    Aceasta functie estimeaza parametrii unei distributii Gaussiene folosind datele din matricea X. Output-ul consta in: 
        -mean_values: Un vector de lungime n care contine valorile medii (media) pentru fiecare caracteristica.
        -variances: Matricea de variante a caracteristicilor.
### function probabilities = multivariate_gaussian(X, mean_values, variances)

    Aceasta functie calculeaza densitatea de probabilitate a unei distributii gaussiene multivariate pentru fiecare punct din matricea X, pe baza formulei definite in enunt si folosind output-ul functiei anterioare. Aceasta intoarce probabilities, un vector de lungime x care contine densitatile de probabilitate calculate pentru fiecare punct din matricea X.

### function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)

    Aceasta functie compara toate predictiile cu rezultatul asteptat si calculeaza numarul de rezultate false pozitives, false negatives si true pozitives, pe care le returneaza.

## Task 2: Kernel Regression

### function retval = linear_kernel (x, y, other)
    Aceasta implementeaza kernelul liniar pe baza formulelor cunoscute.
### function retval = polynomial_kernel (x, y, d)
    Aceasta implementeaza kernelul polinomial pe baza formulelor cunoscute.
### function retval = gaussian_kernel (x, y, sigma)
    Aceasta implementeaza kernelul gaussian pe baza formulelor cunoscute.
### function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)

    Aceasta functie imparte setul de date in doua subseturi: un set de antrenament (primele round(percentage * lines) randuri si coloane din matricea X)si un set de test (restul de linii si coloane din matricea data, X). Setul de antrenament este folosit pentru antrenarea modelelor, in timp ce setul de test este folosit pentru evaluarea performantei modelelor.

### function [K] = build_kernel (X, f, f_param)

    Se construieste matricea de kernel corespunzatoare celor doua functii, f - functia de kernel si f_param - parametru necesar pentru functia f, asa cum este descrisa in enuntul temei. Aceasta foloseste randurile si coloanele din matricea X.

### function [L] = cholesky (A)

    Algoritmul eficient Cholesky, folosit pentru descompunerea matricei A in doua matrice, L - inferior triunghiulara si L' - superior triunghiulara. Acesta este realizat pe baza algoritmului predat la cursul de metode numerice.

### function [P] = get_lower_inverse (L)

    Algoritmul Gauss-Jordan, folosit pentru inversarea unei matrice folosind metode de eliminare gaussiana.
    Algoritmul este realizat pe baza celui deja existent (de exemplu %https://mathsfromnothing.au/matrix-inverse/?i=1).

### function [a] = get_prediction_params (K, y, lambda)

    Functia primeste ca parametri matricea de kernel, valorile evaluate pentru input-urile pe care a fost construit K si parametrul lambda folosit pentru regularizare si intoarce vectorul coloana a ce contine estimari ai parametrilor folositi la evaluare, calculat pe baza formulei din enunt. Acest algoritm foloseste metode neiterative pentru calcularea inversei matricei A = lambda * Im + K, aplicand Cholesky pentru descompunerea LU si get_lower_inverse pentru determinarea inversei lui C = cholesky(A); apoi se determina a folosind formula data si proprietati matematice cunoscute.

### function [x] = conjugate_gradient (A, b, x0, tol, max_iter) 

    Functia implementeaza metoda gradientului conjugat pe baza codului primit in enunt.

### function [a] = get_prediction_params_iterative (K, y, lambda)
    
    Analog ca la functia anterioara, insa acest algoritm calculeaza inversa lui A iterativ, pe baza metodei gradientului conjugat (determina fiecare coloana a inversei lui A); alegem toleranta, x0 si numarul maxim de iteratii convenabil.

### function pred = eval_value(x, X, f, f_param, a)

    Aceasta functie prezice valoarea unui vector de intrare x in functie de toti vectorii de intrare folositi pentru a antrena modelul, folosind o functie de kernel specificata si vectorul de parametri de predictie; algoritmul este implementat pe baza formulei din enunt.

## Task 3: Generare de text

### function retval = distinct_words (tokens)

    Aceasta functie intoarce tokenurile sortate si unice.

### function B = k_secv (A, k)

    Aceasta functie genereaza secvente de lungime k dintr-un array de intrare A si le returneaza sub forma de siruri de caractere cu elementele separate printr-un spatiu. Functia initializeaza indexul de start si cel de final al primei secvente si contorul elementului curent, apoi parcurge cell array-ul A, extragand secvente de lungime k. Fiecare secventa este unita intr-un sir de caractere cu elementele separate printr-un spatiu folosind functia strjoin; sirurile rezultate sunt stocate intr-un nou cell array, returnat la iesire.

### function unique_cell_array = distinct_k_secv (cell_array)

    Aceasta functie intoarce k-secventele sortate si unice (functiile sort si unique).

### function retval = word_idx (distinct_wds)

    Aceasta functie intoarce un dictionar care contine indecsii asociati fiecarui label.

### function retval = k_secv_idx (distinct_k_sec)

    Aceasta functie creeaza un dictionar care mapeaza fiecare element distinct dintr-o secventa de k la indicele sau.

### function retval = stochastic_matrix (k_secv_corpus, corpus_words, words_idx, k_secv_idx, k)

    Aceasta functie construieste o matrice stocastica bazata pe instructiunile din enunt. Functia initializeaza dimensiunile matricei stocastice cu lungimile corespunzatoare ale seturilor de intrare si foloseste o matrice sparse pentru retval, pentru o eficienta mai mare; folosim un dictionar pentru cautarea mai rapida a indicilor cuvintelor. Pentru fiecare secventa din cell array-ul sortat si unic de secvente se cauta indicii la care acesta apare in cell array-ul original, iar acestia se salveaza intr-un alt vector. Pe baza acestora, se coreleaza indicii cuvintelor si se salveaza numarul de aparitii al fiecaruia pe pozitia corespunzatoare din matricea stocastica. 