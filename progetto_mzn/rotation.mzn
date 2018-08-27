include "globals.mzn";
include "alldifferent.mzn";
int :rows;
int :columns;
int :colors;
int : nSquares=rows*columns;
array[1..nSquares,1..4] of int : setSquares;
array[1..nSquares] of var 1..nSquares : Position;
constraint alldifferent([Position[i] |i in 1..nSquares]);
array[1..nSquares] of var 0..3: Rotation;

constraint forall(i in 1..nSquares-columns)
       (setSquares[Position[i],if(3+Rotation[Position[i]])mod 4==0 then 4
                               else (3+Rotation[Position[i]])mod 4 
                               endif]=setSquares[Position[i+columns],if(1+Rotation[Position[i+columns]])mod 4==0 then 4
                                                                     else(1+Rotation[Position[i+columns]])mod 4 
                                                                     endif]);
constraint forall(j in 1..nSquares where j mod columns != 0) 
        (setSquares[Position[j],if(2+Rotation[Position[j]])mod 4==0 then 4
                                else(2+Rotation[Position[j]])mod 4
                                endif]=setSquares[Position[j+1],if(Rotation[Position[j+1]])mod 4==0 then 4 
                                                                else (Rotation[Position[j+1]])mod 4
                                                                endif]);
                                                                
%solve::int_search(Rotation,first_fail,indomain_min, complete) satisfy;

%solve::int_search(Rotation,input_order,indomain_min, complete) satisfy;

%solve::int_search(Rotation,smallest,indomain_min, complete) satisfy;

%solve::int_search(Rotation,largest,indomain_min, complete) satisfy;


solve::int_search(Rotation,first_fail,indomain_max, complete) satisfy;

%solve::int_search(Rotation,input_order,indomain_max, complete) satisfy;

%solve::int_search(Rotation,smallest,indomain_max, complete) satisfy;

%solve::int_search(Rotation,largest,indomain_max, complete) satisfy;


output["gli input dati sono \n"];
output[
       if j mod 2==1 then "|   "++show_int(2,setSquares[i+h*columns, j]) ++ "   |"++
              if i mod columns == 0 then "\n" else "" endif 
       else  "|"++show_int(2,setSquares[i+h*columns, j+2])++show_int(3,i+h*columns)++show_int(2,setSquares[i+h*columns, j])++" |"++
              if i mod columns == 0 then "\n" else "" endif 
       endif | h in 0..rows-1, j in 1..3 , i in 1..columns] ;

output["i quadrati in output sono \n"];

output[
       if j mod 2==1 then "|   "++show_int(2,setSquares[(Position[i+h*columns]),if (j+Rotation[Position[i+h*columns]]) mod 4==0
                                                                          then 4
                                                                          else (j+Rotation[Position[i+h*columns]]) mod 4
                                                                          endif]) ++ "   |"++
              if i mod columns == 0 then "\n" else "" endif 
       else  "|"++show_int(2,setSquares[(Position[i+h*columns]),if (j+2+Rotation[Position[i+h*columns]])mod 4==0
                                                          then 4
                                                          else (j+2+Rotation[Position[i+h*columns]])mod 4
                                                          endif])++show_int(3,Position[i+h*columns])
               ++show_int(2,setSquares[(Position[i+h*columns]), if (j+Rotation[Position[i+h*columns]])mod 4==0
                                                          then 4
                                                          else (j+Rotation[Position[i+h*columns]])mod 4
                                                          endif])++" |"++
              if i mod columns == 0 then "\n" else "" endif 
       endif | h in 0..rows-1, j in 1..3 , i in 1..columns];  
output["con rotazione \n"];       
output[show(Rotation)];     
output[show(Position)];             