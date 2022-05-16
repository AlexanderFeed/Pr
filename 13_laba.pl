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

