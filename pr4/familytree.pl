/*facts*/
f(bella).
f(callie).
f(mariana).
f(mary).
f(grace).
f(shelly).
f(jade).
m(marty).
m(emanuel).
m(jude).
m(jesus).
m(sam).
m(mark).
m(ben).
parent(mary,sam).
parent(mary,jesus).
parent(mary,mariana).
parent(emanuel,sam).
parent(emanuel,jesus).
parent(emanuel,mariana).
parent(marty,jude).
parent(marty,emanuel).
parent(marty,callie).
parent(bella,jude).
parent(bella,emanuel).
parent(bella,callie).
parent(mark,mary).
parent(mark,ben).
parent(grace,mary).
parent(grace,ben).
parent(ben,jade).
parent(shelly,jade).

/*not function*/
not(S) :- S, !, fail; true.

/*relationship functions*/
grandfather(X,Z):- m(X),parent(X,Y),parent(Y,Z).
grandmother(X,Z):- f(X),parent(X,Y),parent(Y,Z).
father(A,B):- m(A),parent(A,B).
mother(A,B):- f(A),parent(A,B).
brother(A,B):- m(A),parent(X,A),parent(X,B).
sister(A,B):- f(A), parent(X,A),parent(X,B).
uncle(A,B):- m(A),parent(X,B),brother(A,X).
aunt(A,B):- f(A),parent(X,B),sister(A,X).
nephew(A,B):- m(A),parent(X,A),parent(G,X),parent(G,B).
niece(A,B):- f(A),parent(X,A),parent(G,X),parent(G,B).
cousin(A,B):- (grandfather(X,A),grandfather(X,B);grandmother(Y,A),grandmother(Y,B)),not(brother(A,B)),not(sister(A,B)).