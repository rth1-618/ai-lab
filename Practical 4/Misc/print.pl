writ([]).
writ[H|T]) :- write(H),nl,writ(T).