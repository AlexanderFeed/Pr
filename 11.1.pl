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
%father(X,Y) :- parent(X,Y), man(X).
vivod(X,Y) :- parent(X,Y), man(X), write(X), !.
father(X) :- vivod(_,X).
%wife(X,Y) :- family(X,Y), woman(X).
w(X,Y) :- woman(X), family(X,Y), write(X), !.
wife(X) :- w(_,X).
grand_da(X,Y) :- ded(X,Y), woman(X), man(Y).
v(X,Y) :- woman(X), man(Y), ded(X,Y), write(X).
grand_dats(X) :- v(_,X).
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
max2(0,Y) :- write(Y), !.
max2(X,Y) :-
    X1 is X div 10,
    A is X mod 10,
    (A> Y, A mod 3 =\= 0 -> K is A;K is Y),
    max2(X1, K).
%19
fib(1,1) :- !.
fib(2,1) :- !.
fib(X,Y) :- X1 is X-1, X2 is X-2, fib(X1,Y1), fib(X2, Y2), Y is Y1 + Y2.
%20
fib2(N,X):-fib2(1,1,2,N,X).
fib2(_,F,N,N,F):-!.
fib2(A,B,K,N,X):-C is A+B, K1 is K+1,fib2(B,C,K1,N,X).
