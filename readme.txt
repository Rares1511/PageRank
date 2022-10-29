------- Popa Rares Teodor, Grupa 314CB -------

---- Iterative ---- 
Citim numarul de pagini apoi citim rand cu rand urm valori:
node - codul paginii curente
L ( i ) - numarul de linkuri aflate in pagina curenta
vec - vectorul de vecini al paginii curente
Parcurgem vectorul vec si marcam in matricea de adiacenta valorile A ( i, v ( j ) ) = 1 
unde j merge de la 1 la L ( i ), apoi verificam cazul in care pagina are link la ea, in caz afirmativ
scadem din numarul de linkuri si in matricea de adiacenta punem 0 in pozitia A ( i, i )

Initializam vectorul coloana PR0 cu 1 / n peste tot, apoi intram in algoritm
Calculam suma pentru PR ( i, t + 1 ) mergand prin matricea de adiacenta si verifcand
unde exista o legatura de la j la i unde j merge de la 1 la n. In cazul in care exista
legatura de la j la i adaugam la suma PR0 ( j ) / L ( j ).
La final in PR1 ( i ) vom pune ( 1 - d ) / n + d * S, calculam norma dintre PR1 si PR0 
si in cazul in care vom mai face un pas punem rezultatul obtinut in PR1 in PR0

---- Algebraic ----
Repetam aceeasi metoda de citire si de a crea matricea de adiacenta ca la metoda iterativa.
Cream matricea K ce contine pe diagonala valorile aflate in L, apoi calculam matricea M
folsind formula M = ( K ^ (-1) * A )'. Apoi R il vom calcula cu formula ( I - d * M ) ^ (-1) * ( 1 - d ) / n * 1
unde 1 reprezinta vectorul coloana ce are valori numai 1.

---- PageRank ----
Repetam aceeasi metoda de citire insa la final citim valorile val1 si val2.
Apelam apoi Functia Iterative si Algebraic, le obtinem rezultatele si le afisam in fisierul de iesire
creat. 
La final folosim functia de sortare pentru a sorta matricea PR1 ce contine pe prima coloana
valorile PR si pe a doua indicele ale carei pagini ii apartine acel PR. 
Pentru final vom parcurge cu un for de la 1 la n si afisam i, PR1 ( i, 2 ) si
Apartenenta ( PR ( i, 1 ), val1, val2 ) in fisierulde iesire.
