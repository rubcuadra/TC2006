%%Comparadores, nos diran si todos los e del arreglo son mayores a un numero (o menores)
smallers(_,[]). 
smallers(Num,[H|T])  :- smallers(Num,T), H<Num.
biggersEq(_,[]). 
biggersEq(Num,[H|T]) :- biggersEq(Num,T), H>=Num.
%%Permuta, si son smallers, si son biggers, acaba
%%Recibe el pivote, Lista, Menores, Mayores
%%Solo sirve si L esta ordenada
bg_sm(Num,L,X,Y) :- 
	append(X,Y,L), 
	smallers(Num,X),    
	biggersEq(Num,Y).

%Dividir el arreglo en mayores y menores
mSplit(_,[],L1,L2,L1,L2).
mSplit(Num,[H|T],L1,L2,R1,R2) :- H<Num, append([H],L1,Temp), mSplit(Num,T,Temp,L2,R1,R2).
mSplit(Num,[H|T],L1,L2,R1,R2) :- H==Num, mSplit(Num,T,L1,L2,R1,R2).
mSplit(Num,[H|T],L1,L2,R1,R2) :- H>Num, append([H],L2,Temp), mSplit(Num,T,L1,Temp,R1,R2).
mSplit(Num,L,SML,BGR) :- mSplit(Num,L,[],[],SML,BGR).

mSort([],[]).
mSort([H|T],Result) :- mSplit(H,T,Mn,Mx), mSort(Mn,N), mSort(Mx,X), append(N,[H],Temp), append(Temp,X,Result).

main:-
	append([],[7,1,3,4,5,6],R),
	mSplit(4,R,SML,BGR), %bg_sm(4,R,SML,BGR), %Solo sirve si R esta ordenada
	write(SML), 
	write(BGR),

	mSort(R,S),
	write(S).