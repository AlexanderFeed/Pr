man(petya).
man(sasha).
man(kolya).
woman(katya).
woman(masha).
parent(sasha, katya).
parent(masha, katya).
family(sasha, masha).
family(masha, sasha).
ded(katya, petya).%У  Кати дед Петя
%father(X,Y) :- parent(X,Y), man(X).
vivod(X,Y) :- parent(X,Y), man(X), write(X), !.
father(X) :- vivod(_,X).
%wife(X,Y) :- family(X,Y), woman(X).
w(X,Y) :- woman(X), family(X,Y), write(X), !.
wife(X) :- w(_,X).
grand_pa(X,Y) :- ded(X,Y).


