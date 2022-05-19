%11
minch([H|T]) :- minch(T,H).
minch([],A):- !, write(A),!.
minch([H|T],A) :- A<H, 0 is A mod 2, minch(T,A); minch(T,H).
%12
%prost(A) :- A1 is A-1, prost(A,A1).
%prost(_,0) :- !, true.
%prost(_,1) :- !, true.
%prost(A,B) :- 0 is A mod B,!, fail;B1 is B-1, prost(A,B1).
append([], List2, List2).
append([Head|Tail], List2, [Head|TailResult]):-
   append(Tail, List2, TailResult).
kon([]) :-!, fail,!.
kon([H|T]) :- write(H),nl, kon(T),!.
fun12([H|T]) :- fun12(_,[H|T]),!.
fun12([_|To],[]):-!, kon(To),!.
fun12([Ho|To],[H|T]) :- H>0, write(H), nl,!,
    fun12([Ho|To],T),!; append([Ho|To],[H],C),!, fun12(C,T).
%13не робит
permutation1(_,0,Premka,Premka).
permutation1(A,Lenght,Perm,Premka):-
    list_find_ex(A,El,T),L1 is Lenght-1,permutation1(T,L1,[El|Perm],Premka).

list_find_ex([El|T],El,T).
list_find_ex([H|T],El,[H|Tail]):-list_find_ex(T,El,Tail).

list_find_ex_stop([El|T],El,T):-!.
list_find_ex_stop([H|T],El,[H|Tail]):-list_find_ex_stop(T,El,Tail).

list_lenght1([],0):-!.
list_lenght1([_|T],L):- list_lenght1(T,L1),L is L1 + 1.

list_quantity_sum_any_two_digit([H|T],Q):-list_quantity_sum_any_two_digit([H|T],T,H,Q).
list_quantity_sum_any_two_digit(_,[],_,0):-!.
list_quantity_sum_any_two_digit(List,[H|T],El,Q):-
    list_find_ex_stop(List,El,Ex), func_2(Ex,El),!,
    list_quantity_sum_any_two_digit(List,T,H,Q1),Q is Q1+1.
list_quantity_sum_any_two_digit(List,[H|T],_,Q):-
    list_quantity_sum_any_two_digit(List,T,H,Q).

func_1([H|T],El):-func_1(T,H,El).
func_1([],_,_):-true.
func_1([H|T],Previous,El):-El1 is Previous + H,!,func_1(T,H,El1).
func_1(_,_,_):-false.

func_2(Ex,El):-list_lenght1(Ex,L),
    permutation1(Ex,L,[],EX),func_1(EX,El).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).
sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).
sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).
next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).
el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).
%14
in_list([],_) :- fail,!.
in_list([X|_],X).
in_list([_|T],X) :- in_list(T,X).
fun14 :- Hairs=[_,_,_],
in_list(Hairs,[belokurov,_]),
in_list(Hairs,[chernov,_]),
in_list(Hairs,[rizhov,_]),
in_list(Hairs,[_,ginger]),
in_list(Hairs,[_,blond]),
in_list(Hairs,[_,brunette]),
not(in_list(Hairs,[belokurov,blond])),
not(in_list(Hairs,[chernov,brunette])),
not(in_list(Hairs,[rizhov,ginger])),
write(Hairs),!.
%15
fun15 :- Col = [_,_,_],
in_list(Col,[ann,_,_]),
in_list(Col,[val,_,_]),
in_list(Col,[nat,_,_]),
in_list(Col,[_,white,_]),
in_list(Col,[_,green,_]),
in_list(Col,[_,blue,_]),
in_list(Col,[_,_,white]),
in_list(Col,[_,_,green]),
in_list(Col,[_,_,blue]),
in_list(Col,[ann,_,_]),
not(in_list(Col,[val,white,white])),
in_list(Col,[nat,_,green]),
not(in_list(Col,[nat,green,_])),
write(Col),!.
%16 spec, familia, kolvo brat i sestr, age, wife
fun16 :- Work = [_,_,_],
in_list(Work,[sles,_,0,mlad,_]),
in_list(Work,[tok,_,_,sred,_]),
in_list(Work,[svar,_,_,_,_]),
in_list(Work,[_,semenov,_,starsh,borisova]),
in_list(Work,[_,ivanov,_,_,_]),
in_list(Work,[_,borisov,1,_,_]),
in_list(Workers,[sles,W1,_,_,_]),
in_list(Workers,[tok,W2,_,_,_]),
in_list(Workers,[svar,W3,_,_,_]),
write('Fam sles is'), writeln(W1),
write('Fam tok is'), writeln(W2),
write('Fam svar is'), writeln(W3).
%17 sosud, liq, mesto
%B справа от A в C
right(_,_,[_]):-fail.
right(A,B,[A|[B|_]]).
right(A,B,[_|List]):-right(A,B,List).

%B слева от A в C
left(_,_,[_]):-fail.
left(A,B,[B|[A|_]]).
left(A,B,[_|List]):-left(A,B,List).

%Около A в C
next(A,B,List):-right(A,B,List).
next(A,B,List):-left(A,B,List).

fun17:- Drink=[_,_,_,_],
in_list(Drink,[bottle,_]),
in_list(Drink,[glass,_]),
in_list(Drink,[kuvshin,_]),
in_list(Drink,[jar,_]),
in_list(Drink,[_,milk]),
in_list(Drink,[_,lemonade]),
in_list(Drink,[_,kvas]),
in_list(Drink,[_,agua]),
not(in_list(Drink,[bottle,milk])),
not(in_list(Drink,[bottle,agua])),
not(in_list(Drink,[jar,lemonade])),
not(in_list(Drink,[jar,agua])),
left([_,lemonade],[kuvshin,_],Drink),
right([_,lemonade],[_,kvas],Drink),
next([glass,_],[jar,_],Drink),
next([glass,_],[_,milk],Drink),
write(Drink),!.
%18
fun18 :- Ch = [_,_,_],
in_list(Ch,[voronov,_]),
in_list(Ch,[pavlov,_]),
in_list(Ch,[levic,_]),
in_list(Ch,[saharov,_]),
in_list(Ch,[_,dance]),
in_list(Ch,[_,artist]),
in_list(Ch,[_,singer]),
in_list(Ch,[_,writer]),
not(in_list(Ch,[levic,singer])),
not(in_list(Ch,[voronov,singer])),
not(in_list(Ch,[pavlov,writer])),
not(in_list(Ch,[pavlov,artist])),
not(in_list(Ch,[saharov,writer])),
not(in_list(Ch,[voronov,writer])),
write(Ch),!.
%19 name, race, place, sport
fun19 :- Chto =(_,_,_),
in_list(Chto,[mike,_,_,basket]),
in_list(Chto,[rich,_,_,_]),
in_list(Chto,[simon,israel,_,_]),
in_list(Chto,[_,_,1,kriket]),
in_list(Chto,[_,_,_,tenis]),
in_list(Chto,[_,austral,_,_]),
in_list(Chto,[_,amerika,_,_]),
in_list(Chto,[_,_,2,_]),
in_list(Chto,[_,_,3,_]),
not(in_list(Chto,[simon,_,_,tenis])),
not(in_list(Chto,[mike,amerika,_,_])),
in_list(Chto,[W1,austral,_,_]),
in_list(Chto,[rich,_,C1,_]),
write('Austral is'), writeln(W1), write('Rich is'), writeln(C1).
