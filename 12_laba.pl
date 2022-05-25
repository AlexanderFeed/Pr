%11
nod(G) :-!, G=\=1.
nod(A,B,_) :-
    Anew is A mod B,
    Bnew is B mod A,
    (
      Anew == 0, !, G1 is B, nod(G1);
      Bnew == 0, !, G1 is A, nod(G1);
      A > B, !, nod(Anew,B,G1);
      nod(A, Bnew,G1)
     ).
nod(A,B) :- nod(A,B,0).
%false - НОД = 1, иначе true
d(A,C,A,X) :- !, C is X.
d(A,C,I,CX) :- 0 is I mod 2, nod(A,I),!,
    CX1 is CX+1, I1 is I+1, d(A,C,I1,CX1).
d(A,C,I,CX) :- I1 is I+1, d(A,C,I1,CX),!.
d(A, W):- d(A,W,1,0).

u(A,0,A) :-!.
u(A,C,I) :- 0 is I mod 2, nod(A,I),!, I1 is I+1,
    u(A,C1,I1), C is C1+1.
u(A,C,I) :- I1 is I+1, u(A,C,I1).
u(A,W) :- u(A,W,1).
%12
mindi(_,_,0):-!.
mindi(A,A,I):- A>4, A is I*I,!.
mindi(A,Div,I):- 0 is A mod I,!,
    Div is I, mindi(A,Div,0).
mindi(A,Div,I):- I1 is I +1, mindi(A,Div,I1).
mindi(1,1):-!.
mindi(0,_):- !,fail.
mindi(A,Div):- mindi(A,Div,2).
common(A, B, L):-
    nod(A, B,G),
    L is (A*B)/G.
sum(0,0):-!.
sum(A,Sum):-(A mod 10) < 5,!,
    A1 is A div 10,S is (A mod 10), sum(A1,Sum1),Sum is Sum1+S.
sum(A,Sum):- A1 is A div 10,sum(A1,Sum).
l(0,0):- !.
l(A,B) :- A1 is A div 10, l(A1,B1), B is B1 +1.
f(_,_,_,1):-!,fail.
f(A,X,Div,I):- not(nod(A,I,1)),not(0 is (I mod Div)),!,
    X is I.
f(A,X,Div,I):- I1 is I - 1, f(A,X,Div,I1).
f(A,X):- mindi(A,Div),I is A -1,
    f(A,X1,Div,I),
    sum(A,Y),X is X1 * Y.
%13
fun13(0,XX,_,XX):-!.
fun13(N,X,L,XX):- N1 is N-1,l(N1,L1),L1 is L,!,
    pow(10,L,Y),XX1 is (N+XX)*Y,fun13(N1,X,L1,XX1).
fun13(N,X,L,XX):- N1 is N-1,L1 is L-1, pow(10,L1,Y),
    XX1 is (N+XX)*Y,fun13(N1,X,L1,XX1).
fun13(N,X,L,XX):- N1 is N-1,
    XX1 is (N+XX),fun13(N1,X,L,XX1).
fun13(N,X):-l(N,L), fun13(N,X,L,0).

read_list(0,[]):-!.
read_list(N,[H|T]):- read(H),
    Nmin1 is N - 1,read_list(Nmin1,T).

write_list([]):-!.
write_list([H|T]):- write(H),write(' '), write_list([T]).

list_min([],M,M):-!.
list_min([H|T],X,M):-H<M,
    list_min(T,X,H).
list_min([_|T],X,M):- list_min(T,X,M).
list_min([H|T],X):-list_min(T,X,H).

list_max([],M,M):-!.
list_max([H|T],X,M):-H>M,
    list_max(T,X,H).
list_max([_|T],X,M):- list_max(T,X,M).
list_max([H|T],X):-list_max(T,X,H).

concat1([],B,B):-!.
concat1([H|T],B,[H|Tail]):- concat1(T,B,Tail).

list_find([],_,0):-!.
list_find([H|T],X,Q):- H is X,!,
    list_find(T,X,Q1),Q is Q1 +1.
list_find([_|T],X,Q):- list_find(T,X,Q).

list_rev(ListX,ListY):-list_rev(ListX,[],ListY,ListY).
list_rev([],ListY,ListY,[]).
list_rev([X|TX],ListR,ListY,[_|Bound]):- list_rev(TX,[X|ListR],ListY,Bound).
%14
len([],0):-!.
len([_|T],A):-len(T,A1),A is A1+1.
%15
fun15([H|_],[],M,Qm):- Qm is 1, H is M,!.
fun15([H|T],[H|Tn],M,Qm):-H is M,!,
    Qm1 is Qm -1,fun15(T,Tn,M,Qm1).
fun15([H|T],[H|Tn],M,Qm):-fun15(T,Tn,M,Qm).
fun15(List,NewList):-list_min(List,M),list_find(List,M,Qm),fun15(List,NewList,M,Qm).
%16
fun16([],[],[],[],_,_,_,_):-!.

fun16([H|T],[H|Tn],L2,L3,Max,Min,Fx,Fn):-H is Min,!,
    Fn0 is Fn - 1,fun16(T,Tn,L2,L3,Max,Min,Fx,Fn0).
fun16([H|T],[H|Tn],L2,L3,Max,Min,Fx,Fn):-Fn is 1,!,
    fun16(T,Tn,L2,L3,Max,Min,Fx,Fn).

fun16([H|T],L1,L2,[H|Tn],Max,Min,Fx,Fn):-H is Max,!,
    Fx0 is Fx - 1,fun16(T,L1,L2,Tn,Max,Min,Fx0,Fn).
fun16([H|T],L1,L2,[H|Tn],Max,Min,Fx,Fn):-Fx is 0,!,
    fun16(T,L1,L2,Tn,Max,Min,Fx,Fn).

fun16([H|T],L1,[H|Tn],L3,Max,Min,Fx,Fn):-Fx is 1,Fn is 0,
    fun16(T,L1,Tn,L3,Max,Min,Fx,Fn).

fun16(List,NewList):-
    list_min(List,Min),list_max(List,Max),fun16(List,List1,List2,List3,Max,Min,1,1),list_rev(List2,ListR),concat1(List1,ListR,NewList1),concat1(NewList1,List3,NewList).
%17
fun17([],M1,M2) :-!, write(M1),nl, write(M2),!.
fun17([H|T]) :- fun17(T,H).
fun17([H|T],M1) :- fun17(T,M1,H).
fun17([H|T],M1,M2) :- H >=M1, M22 is M1,
    M11 is H, !,
    fun17(T,M11,M22);
    H>=M2, M22 is H,!, fun17(T,M1,M22).
%18
fun18([],M,M1,M,M1):-!.
fun18([H|T],X1,X2,M,_):-H>M,
    fun18(T,X1,X2,H,M).
fun18([_|T],X1,X2,M,M2):- fun18(T,X1,X2,M,M2).
fun18([H|T],X1,X2):-fun18(T,X1,X2,H,0).
%19
fun19([],0):-!.
fun19([H|T],X):-0 is H mod 2,!,
    fun19(T,X1),X is X1 + 1.
fun19([_|T],X):- fun19(T,X).
%20
fun20([],_,_,[]):-!.
fun20([H|T],A,B,[H|Tn]):- H>=A,H=<B,!,
    fun20(T,A,B,Tn).
fun20([_|T],A,B,X):- fun20(T,A,B,X).
