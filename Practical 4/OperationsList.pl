list(X,[X|_]).
list(X,[_|TAIL]) :- list(X,TAIL).

concat([],L,L).
concat([X1|L1],L2,[X1|L3]) :- concat(L1,L2,L3).

remove(X, [X], []).
remove(X,[X|L1], L1).
remove(X, [Y|L2], [Y|L1]) :- remove(X,L2,L1).

list(X,[X|_]).
list(X,[_|TAIL]) :- list(X,TAIL).
append(A,T,T) :- list(A,T),!.
append(A,T,[A|T]).

