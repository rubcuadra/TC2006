%% A01019102
myAppend(A,B,B,A).
%myAppend([1,2,3|B],B,[4,5],X).
%myAppend([1,2,3],X,[5,6,|Y],Y).
myAppend2(A-B,B,A).
%myAppend2([1,2,3|X]-X,[4,5],Y).
%myAppend2([4,5|X]-X,[1,2,3],Y).

assert(edad(pedro, 15)).
assert(joven(pedro)).
assert((joven(x):- edad(x,y), y <18)).

%retract(edad(pedro,15)).

:-dynamic tabla/3.
sumpot(X,Y,Z):- tabla(X,Y,Z),!.
sumpot(X,Y,Z):- Z is (X+Y)*(X+Y), assert(tabla(X,Y,Z)).


rotateL([E|T], R) :- append(T,[E],R).
rotateR(L,R) :- rotateL(R, L).

:-dynamic is_prime/1.
nonDiv(N,D) :- N =< D.
nonDiv(N,D) :- N > D,                 
  			   N mod D =\= 0,               
  			   D1 is D + 1,                 
			   nonDiv(N,D1).
%Antes estana permutation(NumL,N) en lugar de rotateL(NumL,N), por eso no jalaba
is_prime(Num) :- Num>1, nonDiv(Num,2). %%num deberia ser raiz +1  
is_not_circular_prime(Num):- number_chars(Num,NumL),rotateL(NumL,N),number_chars(PerNum,N),\+is_prime(PerNum),!.
is_circular_prime(Num):- \+is_not_circular_prime(Num).

main:-
	is_circular_prime(199933),
	write(1).