go :-
write('Hello!'),nl,
write('Patient name: '),
read(Patient),get_single_char(Code),
hypothesis(Patient,Disease),nl,
write_list([Patient,' is diagnosed with ',Disease,'.']),nl.

symptom(Patient,fever) :- 
verify(Patient," suffering from a fever (y/n) ?").
symptom(Patient,rashes) :- 
verify(Patient," having rashes (y/n) ?").
symptom(Patient,headache) :- 
verify(Patient," suffering from headache (y/n) ?").
symptom(Patient,breathlessness) :- 
verify(Patient," suffering from breathlessness (y/n) ?").
symptom(Patient,omiting) :- 
verify(Patient," suffering from omiting (y/n) ?").
symptom(Patient,body_ache) :- 
verify(Patient," having body_ache (y/n) ?").
symptom(Patient,skin_discoloration) :- 
verify(Patient," suffering from skin_discoloration (y/n) ?").
symptom(Patient,sore_throat) :- 
verify(Patient," having a sore_throat (y/n) ?").
symptom(Patient,weakness) :- 
verify(Patient," suffering from weakness (y/n) ?").
symptom(Patient,swelling) :- 
verify(Patient," having swelling(y/n) ?").
symptom(Patient,pain) :- 
verify(Patient," in pain(y/n) ?").
symptom(Patient,cold) :- 
verify(Patient," having cold(y/n) ?").

ask(Patient,Question) :-
	write(Patient),write(', are you'),write(Question),
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

hypothesis(Patient,arthritis) :-
symptom(Patient,swelling),
symptom(Patient,fever),
symptom(Patient,weakness).

hypothesis(Patient,corona) :-
symptom(Patient,cold),
symptom(Patient,fever),
symptom(Patient,breathlessness),
symptom(Patient,sore_throat),
symptom(Patient,weakness).

hypothesis(Patient,hypotension) :-
symptom(Patient,pain),
symptom(Patient,breathlessness),
symptom(Patient,cold).

hypothesis(Patient,chickenpox) :-
symptom(Patient,fever),
symptom(Patient,weakness),
symptom(Patient,headache),
symptom(Patient,rashes).

hypothesis(Patient,diarrhea) :-
symptom(Patient,fever),
symptom(Patient,pain),
symptom(Patient,omiting).

hypothesis(Patient,malaria) :-
symptom(Patient,fever),
symptom(Patient,pain),
symptom(Patient,cold),
symptom(Patient,omiting),
symptom(Patient,headache).

hypothesis(Patient,jaundice) :-
symptom(Patient,fever),
symptom(Patient,pain),
symptom(Patient,skin_discoloration),
symptom(Patient,headache).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).

