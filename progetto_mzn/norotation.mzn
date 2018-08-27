%dati attesi m n a(matrice di m*n righe e 4 colonne) k (numero di colori usati)
include "globals.mzn";
include "alldifferent.mzn";
int :rows;
int :columns;
int :colors;
int : nSquares=rows*columns;
array[1..nSquares,1..4] of int : setSquares;
array[1..nSquares] of var 1..nSquares : Position;
constraint alldifferent([Position[i] |i in 1..nSquares]);

constraint forall(i in 1..nSquares-columns)(setSquares[Position[i],3]=setSquares[Position[i+columns],1]);
constraint forall(j in 1..nSquares-1 where j mod columns != 0)(setSquares[Position[j],2]=setSquares[Position[j+1],4]);

%solve::int_search(Position,largest,indomain_min, complete) satisfy;

%solve::int_search(Position,smallest,indomain_min, complete) satisfy;

%solve::int_search(Position,input_order,indomain_min, complete) satisfy;

%solve::int_search(Position,first_fail,indomain_min, complete) satisfy;



%solve::int_search(Position,largest,indomain_max, complete) satisfy;

%solve::int_search(Position,smallest,indomain_max, complete) satisfy;

%solve::int_search(Position,input_order,indomain_max, complete) satisfy;

solve::int_search(Position,first_fail,indomain_max, complete) satisfy;




output["gli input dati sono \n"];
output[
       if j mod 2==1 then "|   "++show_int(2,setSquares[i+h*columns, j]) ++ "   |"++
              if i mod columns == 0 then "\n" else "" endif 
       else  "|"++show_int(2,setSquares[i+h*columns, j+2])++show_int(3,i+h*columns)++show_int(2,setSquares[i+h*columns, j])++" |"++
              if i mod columns == 0 then "\n" else "" endif 
       endif | h in 0..rows-1, j in 1..3 , i in 1..columns] ;

output["i quadrati in output sono \n"];

output[
       if j mod 2==1 then "|   "++show_int(2,setSquares[(Position[i+h*columns]), j]) ++ "   |"++
              if i mod columns == 0 then "\n" else "" endif 
       else  "|"++show_int(2,setSquares[(Position[i+h*columns]), j+2])++show_int(3,Position[i+h*columns])++show_int(2,setSquares[(Position[i+h*columns]), j])++" |"++
              if i mod columns == 0 then "\n" else "" endif 
       endif | h in 0..rows-1, j in 1..3 , i in 1..columns]  
       
                  
                                        