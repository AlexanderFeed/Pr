man(petya). % Дедушка Кати и Коли по отцу
man(sasha). % Муж
man(kolya). % Сын мужа и жены
woman(katya). % Дочь мужа и жены
woman(masha).% Жена
woman(luba). %Бабушка Кати и Коли по отцу
parent(sasha, katya). % Саша отец
parent(masha, katya). % Маша мать
parent(sasha, kolya). % Саша отец
parent(masha, kolya). % Маша мать
family(sasha, masha). % Саша и Маша женаты
family(masha, sasha). % Саша и Маша женаты
bab(luba, katya). %Люба бабушка Кати
bab(luba, kolya). % Любы бабушка Коли
bab(katya, luba). %Люба бабушка Кати
bab(kolya, luba). % Любы бабушка Коли
ded(katya, petya).%У  Кати дед Петя
ded(kolya, petya).%У  Коли дед Петя
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
proverka(X,Y, CH) :- X>Y, max(CH,X).
max(0,Y) :- Y mod 3 is 0, write(Y), !.
max(0,_) :- write('Нет кратных 3'), !.
max(X,Y) :-
    Z is X mod 10, X1 is X div 10,
    A is Z mod 3, A is 0, proverka(Z,Y, X1); X1 is X div 10, max(X1,Y).
