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
%11down
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
