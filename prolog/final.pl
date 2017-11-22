%% 1. TODO invocar
sumaAc(X,R) :- sumaA(X,0,R).
sumaAc([],_,[]).
sumaAc([H|T],Sum,[H1|T1]) :- H1 is H + Sum, sumaAc(T,H1,T1).

% 2.
listh(_, 0, []).
listh([H|T], N, [H|Sub]) :- N1 is N-1, listh(T, N1, Sub).
listt(T, 0, T).
listt([_|T], N, R) :- N1 is N-1, listt(T, N1, R).
merge(A, [], A).
merge([], B, B).
merge([Ha|Ta], [Hb|Tb], [Ha|Sub]) :- Ha < Hb, merge(Ta, [Hb|Tb], Sub).
merge([Ha|Ta], [Hb|Tb], [Hb|Sub]) :- Ha >= Hb, merge([Ha|Ta], Tb, Sub).
mergesort([H], [H]).
mergesort(List, Sorted) :-
			listh(List, Half, H),
			listt(List, Half, T),
			mergesort(H, A),
			mergesort(T, B),
			merge(A, B, Sorted).

% 3.
insSort(List, [], List).
insSort(List, [H|T], R):-insert(List, H, B),insSort(B, T, R).
insert(List, Num, A):- separa(Num, List, L, R), append(L,[Num],B), append(B,R,A).
separa(N, [H|T], [H|L], R):-H =< N,separa(N, T, L, R).
separa(N, [H|T], L, [H|R]):-H > N,separa(N, T, L, R).
separa(_, [], [], []).

% 4.
subset([],_).
subset([X|_],[X|Y]) :- subset(_, Y).
subset([X|Z],[_|Y]) :- subset([X|Z],Y).

% 5.
enteroDivisible(Result) :- enteroDivisible(1, 1, Result).
enteroDivisible(Start, 21, Result):- Result = Start, !.
enteroDivisible(Start, Div, Result):- X is Start mod Div,
    ( X == 0 ->
      D is Div + 1,
      enteroDivisible(Start, D, Result);
      S is Start + 1,
      enteroDivisible(S, 1, Result) ).

% 6.

% 7.
isPalindrome(Num):- number_chars(Num, X), reverse(X, Res), X == Res.
mult(Counter, _, Max, Res):- Counter =:= 999, Res is Max.
mult(Counter, X, Max, Res):- MultRes is (Counter * X), Z is (Counter + 1), isPalindrome(MultRes), (MultRes > Max -> MaxRes is MultRes; MaxRes is Max), mult(Z, X, MaxRes, Res).
mult(Counter, X, Max, Res):- Z is (Counter + 1), mult(Z, X, Max, Res).
palindrome(Num1, Max, ResPal):- Num1 =:= 999, ResPal is Max. 
palindrome(Num1, Max, ResPal):- Z is (Num1 + 1), mult(100, Num1, Max, Res), (Res > Max -> MaxRes is Res; MaxRes is Max), palindrome(Z, MaxRes, ResPal).


%% 8. Definir arbol - Yo hice todo lo del 8
copyTree(T,T).
t(_,nil,nil).
t(_,_,nil).
t(_,nil,_).
t(_,_,_).

%% 8.a 
%% (F es el arbol final)
inTree(V, t(N,L,R) ):- V<N -> inTree(V,L) ; 
					   V>N -> inTree(V,R) ; !.
insertTT(_,nil,F,F).
insertTT(V,t(N,L,R),Res,F) :- V<N->insertTT(V,L,t(N,Res,R),F);
								   insertTT(V,R,t(N,L,Res),F).
%% 8.b  
insertToTree(V,T,Res) :- inTree(V,T)->copyTree(T,Res)
									 ;insertTT(V,T,t(V,nil,nil),Res).
%% 8.c
maxInTree(nil,Res,Res).
maxInTree( t(V,_,R), Res, _) :- maxInTree(R,Res,V).
maxInTree( t(V,_,R), Res) :- maxInTree(R,Res,V).
%% 8.d
minInTree(nil,Res,Res).
minInTree(t(V,L,_),Res,_) :- minInTree(L,Res,V).
minInTree(t(V,L,_),Res) :- minInTree(L,Res,V).

main :-
	Tree = t(8,t(4,t(2,nil,nil),nil),nil),
	inTree( 8, Tree ),
	insertToTree( 6,Tree ,Rs),
	write(Rs),
	maxInTree( Tree , Max),
	write(Max),
	minInTree( Tree , Min),
	write(Min),
	write(1).

