man(petya).
man(sasha).
man(kolya).
woman(katya).
woman(masha).
parent(sasha, katya).
parent(masha, katya).
family(sasha, masha).
family(masha, sasha).
ded(katya, petya).%�  ���� ��� ����
%father(X,Y) :- parent(X,Y), man(X).
vivod(X,Y) :- parent(X,Y), man(X), write(X), !.
father(X) :- vivod(_,X).
%wife(X,Y) :- family(X,Y), woman(X).
w(X,Y) :- woman(X), family(X,Y), write(X), !.
wife(X) :- w(_,X).
grand_da(X,Y) :- ded(X,Y), woman(X), man(Y).
v(X,Y) :- woman(X), man(Y), ded(X,Y), write(X).
grand_dats(X) :- v(_,X).
