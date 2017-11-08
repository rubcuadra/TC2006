%%Comparadores, nos diran si todos los e del arreglo son mayores a un numero (o menores)
smallers(_,[]). 
smallers(Num,[H|T])  :- smallers(Num,T), H<Num.
biggersEq(_,[]). 
biggersEq(Num,[H|T]) :- biggersEq(Num,T), H>=Num.
%%Permuta, si son smallers, si son biggers, acaba
%%Recibe el pivote, Lista, Menores, Mayores
bg_sm(Num,L,X,Y) :- 
	append(X,Y,L), 
	smallers(Num,X),    
	biggersEq(Num,Y).

mSort([],[]).
mSort([H|T],Result) :- bg_sm(H,T,Mn,Mx), mSort(Mn,N), mSort(Mx,X), append(N,[H],Temp), append(Temp,X,Result).

main:-
	append([],[1,1,3,4,5,6],R),
	bg_sm(4,R,SM,BG), 
	write(SM), 
	write(BG),
	sort(R,S),
	write(S).