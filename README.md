# csp_coloredsquares

In questa repository è presente un programma Minizinc che permette di risolvere il problema dei "Quadrati colorati": dati un numero arbitrario di quadrati con i lati colorati con un numero arbitrario di possibili colori, vogliamo trovare un modo per disporli in una griglia in maniera tale che a lati adiacenti di quadrati vicini corrispondano colori uguali.

Sono previste due possibilità per risolvere il problema: una permette di spostare e ruotare i quadrati, l'altra solo di spostarli (rispettivamente, rotation e nonrotation).

Come si utilizza il codice:
è possibile mandare in input il numero di quadrati (righe x colonne della griglia), il numero di colori, e i quadrati stessi (completando il campo "setSquares", dove ad una riga corrisponde un quadrato e ad ogni colonna un lato del quadrato nell'ordine top, right, bottom e left) e cercare la soluzione mediante le strategie di ricerca messe a disposizione da Minizinc; un'altra possibilità, è quella di creare un set di quadrati in un file .dzn e lanciare il programma per risolvere il problema descritto da quel file.

Output:
una volta lanciato il programma, l'output è cosi costituito:
vengono presentati i quadrati disposti così come sono stati sottomessi ( i colori sono rappresentati da numeri); sotto, se il problema ha soluzione, vengono rappresentati gli stessi quadrati disposti corretamente. Nel caso sia prevista la rotazione, vengono scritte anche in che numero queste sono state eseguite per trovare la combinazione corretta. 
Il problema si intende con soluzione sconosciuta se il programma supera i 5 minuti di esecuzione.
