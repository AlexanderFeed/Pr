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
