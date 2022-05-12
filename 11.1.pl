man(petya). % ������� ���� � ���� �� ����
man(sasha). % ���
man(kolya). % ��� ���� � ����
woman(katya). % ���� ���� � ����
woman(masha).% ����
woman(luba). %������� ���� � ���� �� ����
parent(sasha, katya). % ���� ����
parent(masha, katya). % ���� ����
parent(sasha, kolya). % ���� ����
parent(masha, kolya). % ���� ����
family(sasha, masha). % ���� � ���� ������
family(masha, sasha). % ���� � ���� ������
bab(luba, katya). %���� ������� ����
bab(luba, kolya). % ���� ������� ����
bab(katya, luba). %���� ������� ����
bab(kolya, luba). % ���� ������� ����
ded(katya, petya).%�  ���� ��� ����
ded(kolya, petya).%�  ���� ��� ����
father(X,Y) :- parent(X,Y), man(X).
father(X) :- parent(Y,X), man(Y), write(Y), fail.
wife(X,Y) :- family(X,Y), woman(X).
wife(X) :- family(Y,X), woman(Y), write(Y), fail.
grand_da(X,Y) :- ded(X,Y), woman(X), man(Y).
grand_dats(X) :- ded(Y,X), man(X), woman(Y), write(Y), fail.
grand_ma_and_son(X,Y) :- bab(X,Y), man(X); bab(X,Y), man(Y), !.
proiz(X,Y) :- Z is X*Y, write(Z).
proiz_ch(0,Z) :- write(Z).
proiz_ch(X,Y) :- Z is (Y*(X mod 10)), X1 is X div 10, proiz_ch(X1,Z).
%18
proverka(X,Y, CH) :- X>Y, max(CH,X).
max(0,Y) :- Y mod 3 =\= 0, write(Y), !.
max(0,_) :- write('��� �� ������� 3'), !.
max(X,Y) :-
    Z is X mod 10, X1 is X div 10,
    A is Z mod 3, A =\= 0,
    proverka(Z,Y, X1); X1 is X div 10, max(X1,Y).
%17
max2(0,0) :- !.
max2(X,Y) :-
    X1 is X div 10,
    A is X mod 10,
    max2(X1, Y1),
    (A mod 3 =\=0, Y1 < A -> Y is A; Y is Y1).
max2(X):- max2(X,Y), write(Y).
%19
fib(1,1) :- !.
fib(2,1) :- !.
fib(X,Y) :- X1 is X-1, X2 is X-2, fib(X1,Y1), fib(X2, Y2), Y is Y1 + Y2.
%20
fib2(N,X):-fib2(1,1,2,N,X).
fib2(_,F,N,N,F):-!.
fib2(A,B,K,N,X):-C is A+B, K1 is K+1,fib2(B,C,K1,N,X).
