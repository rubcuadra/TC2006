%%Comparadores, nos diran si todos los e del arreglo son mayores a un numero (o menores)
smallers(_,[]). 
smallers(Num,[H|T])  :- smallers(Num,T), H<Num.
biggersEq(_,[]). 
biggersEq(Num,[H|T]) :- biggersEq(Num,T), H>=Num.
%%Permuta, si son smallers, si son biggers, acaba
bg_sm(Num,L,X,Y) :- 
	append(X,Y,L), 
	smallers(Num,X),    
	biggersEq(Num,Y).

main:-
	bg_sm(4,[1,2,3,4,5,6],BG,SM), 
	write(BG), 
	write(SM).