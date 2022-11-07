start :-
write('What is the Patients name? '),
read(P),get_single_char(Code),
hypothesis(P,D),
write_list([P,', probably has ',D,'.']),nl.

start :-
write('Sorry, I don''t seem to be able to'),nl,
write('diagnose the Disease.'),nl.

symptom(P,fever) :- 
verify(P," have a fever (y/n) ?").
symptom(P,rash) :- 
verify(P," have a rash (y/n) ?").
symptom(P,headache) :- 
verify(P," have a headache (y/n) ?").
symptom(P,runny_nose) :- 
verify(P," have a runny_nose (y/n) ?").
symptom(P,conjunctivitis) :- 
verify(P," have a conjunctivitis (y/n) ?").
symptom(P,cough) :- 
verify(P," have a cough (y/n) ?").
symptom(P,body_ache) :- 
verify(P," have a body_ache (y/n) ?").
symptom(P,chills) :- 
verify(P," have a chills (y/n) ?").
symptom(P,sore_throat) :- 
verify(P," have a sore_throat (y/n) ?").
symptom(P,sneezing) :- 
verify(P," have a sneezing (y/n) ?").
symptom(P,swollen_glands) :- 
verify(P," have a swollen_glands (y/n) ?").

ask(P,Question) :-
	write(P),write(', do you'),write(Question),
	read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.



hypothesis(P,german_measles) :-
symptom(P,fever),
symptom(P,headache),
symptom(P,runny_nose),
symptom(P,rash).

hypothesis(P,common_cold) :-
symptom(P,headache),
symptom(P,sneezing),
symptom(P,sore_throat),
symptom(P,runny_nose),
symptom(P,chills).

hypothesis(P,measles) :-
symptom(P,cough),
symptom(P,sneezing),
symptom(P,runny_nose).

hypothesis(P,flu) :-
symptom(P,fever),
symptom(P,headache),
symptom(P,body_ache),
symptom(P,conjunctivitis),
symptom(P,chills),
symptom(P,sore_throat),
symptom(P,runny_nose),
symptom(P,cough).



hypothesis(P,mumps) :-
symptom(P,fever),
symptom(P,swollen_glands).

hypothesis(P,chicken_pox) :-
symptom(P,fever),
symptom(P,chills),
symptom(P,body_ache),
symptom(P,rash).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).