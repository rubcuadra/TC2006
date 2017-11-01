father(tim, bernd).
father(anna, ephraim).
father(daniel, ephraim).
father(celine, daniel).

parent(X,Y) :- father(X,Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

maxL([],V,V).
maxL([H|T],V,R) :- H>V -> maxL(T,H,R) ; maxL(T,V,R).
maxLista([H|T],M) :- maxL(T,H,M).

splitea(Lista,X,Y) :- append(X,Y,Lista), length(X,A), length(Y,B), A=:=B,!.

main:-
	splitea([1,2,3,4,5,6],L1,L2),
	write(L1),
	write(L2),
	maxLista([-1111,-21,-7,-9,-5],M),
	write(M).