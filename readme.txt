Pentru algoritmi am folosit formulele prezentate in sursele date.
Pentru iterative am folosit metoda cu PR in care calculez fiecare element din vector in functie de suma elementelor inbound. L(i) folosit in formula reprezinta numarul de conexiuni outbound al acelui nod.
Pentru algebraic am folosit algoritmul Gram Schmidt modificat pentru descompunere QR. Bazat pe aceasta descompunere am calculat inversa matricii K care are pe diagonala principala numarul de conexiuni outbound de la acel indice.
Am calculat M^ si am iterat pana la o iteratie maxima.
Citirea a fost facuta incarcand intr-un vector tot fisierul si luand element cu element valori din el.
Pentru ca functia u sa fie continuaam calculat a si b in asa fel incat limitele laterale in x = val1 si val2 sa fie egale.
Algoritmul Gram Schmidt Modified este cel pe care l-am facut in cadrul laboratorului.
Pentru testare am folosit exemplele date in fisierul cu cerinta.