next_to(changa,valetva).
next_to(valetva,nadiad).
next_to(valetva,petlad).
next_to(petlad,anand).
next_to(nadiad,valetva).

travel(A,C) :- next_to(A,B),next_to(B,C).

