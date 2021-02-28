% 1 номер
max(X,Y,Z):-X>=Y,Z is X. 
max(X,Y,Z):-Z is Y.

% 2 номер
max(X,Y,Z,X):- X>=Y,X>=Z. 
max(_,Y,Z,Y):-Y>=Z.
max(_,_,Z,Z).

% 3 номер
fact(1,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1), X is X1*N. 

% 4 номер
fact(1,CurX,CurX):-!.
fact(N,CurX,X):-CurX1 is CurX*N, N1 is N-1, fact(N1,CurX1,X). 
factorial(N,X):-fact(N,1,X).

% 5 номер
fib(1,1):-!.
fib(2,1):-!.                                                             
fib(N,X):- N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.

%6 номер
fib(0,A,_,A):-!.
fib(N,A,B,X):- AB is A+B, N1 is N-1, fib(N1,B,AB,X).             
fibonachi(N,X):-fib(N,0,1,X). 

%7 номер
sum(0,0):-!.
sum(N,X):- D is N div 10, M is N mod 10, sum(D,X1), X is M+X1. 

%8 номер
sum(0,Sum,Sum):-!.
sum(N,Sum,X):- D is N div 10, M1 is N mod 10, Sum1 is Sum + M1,sum(D,Sum1,X).  
sumnumbers(N,X):-sum(N,0,X).

%9 номер
min(N,N):-N<10.
min(N,X):-N1 is N div 10, N2 is N mod 10, min(N1,X1), N2=<X1,!, X is N2.  
min(N,X):- N1 is N div 10, N2 is N mod 10, min(N1,X1), N2>X1, X is X1.

%10 номер
min(0,N,N):-!.
min(N,B,X):- D is N mod 10, D<B, !, E is N div 10, min(E,D,X).        
min(N,B,X):- D is N div 10, min(D,B,X).
minimal(N,X):-min(N,10,X).

%11 вверх номер
min3(N,1):-N<3,!.
min3(N,0):-N<10,N>=0,!.
min3(N,X):-N1 is N div 10, N2 is N mod 10, min3(N1,X1), N2<3,!, X is X1+1.  
min3(N,X):- N1 is N div 10, min3(N1,X1), X is X1.

%11 вниз номер
min3(0,K,K):-!.
min3(N,K,X):-D is N mod 10, D<3, !, K1 is K+1 ,E is N div 10, min3(E,K1,X).  
min3(N,K,X):-D is N div 10, min3(D,K,X).
min3down(N,X):- min3(N,0,X).

%12 номер НОД
nod(A,A,A):-!.
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,X):-A>B, C is A mod B, nod(C,B,X).           
nod(A,B,X):-A<B, C is B mod A, nod(A,C,X).

%12 номер простота и колво делителей
kol_del(1,_,1):-!.
kol_del(I,N,Count):-I1 is I-1, kol_del(I1,N,C), (0 is N mod I -> Count is C+1;Count is C). 
kol_del(N,Count):-kol_del(N,N,Count).                                                      
simple(1).
simple(X):- kol_del(X,C), C is 2.


%14 номер вверх
sumnotsimpledel1(_, Del, 0) :- Del < 4, !.
sumnotsimpledel1(N, Del, Sum) :- Del1 is Del - 1, sumnotsimpledel1(N, Del1, Sum1), M is N mod Del, ((M is 0, not(simple(Del))) -> Sum is Sum1 + Del; Sum is Sum1).
sumnotsimpledel1(N, Sum) :- sumnotsimpledel1(N, N, Sum).

%14 номер вниз
sumnotsimpledel2(_, Del, CurSum, CurSum) :- Del < 4, !.
sumnotsimpledel2(N, Del, CurSum, Sum) :- Del1 is Del - 1, M is N mod Del,((M is 0, not(simple(Del))) -> CurSum1 is CurSum + Del; CurSum1 is CurSum), sumnotsimpledel2(N, Del1, CurSum1, Sum).
sumnotsimpledel2(N, Sum) :- sumnotsimpledel2(N, N, 0, Sum).

%15 номер
kol_del15(0,_,0):-!.
kol_del15(1,_,1):-!.
kol_del15(I,N,Count):-I1 is I-1, kol_del15(I1,N,C), (0 is N mod I -> Count is C+1; Count is C).    
kol_del15(N,Count):-kol_del15(N,N,Count).  
simple15(1).
simple15(X):- kol_del15(X,C), C is 2.

sumsimple(0,0):-!.
sumsimple(N,X):- D is N div 10, M is N mod 10, sumsimple(D,X1), simple15(M),!, X is M+X1.
sumsimple(N,X):- D is N div 10, sumsimple(D,X1), X is X1.   

nod(A,A,A):-!.
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,X):-A>B, C is A mod B, nod(C,B,X).           
nod(A,B,X):-A<B, C is B mod A, nod(A,C,X).

mutsimple(N1,N2):- nod(N1,N2,Nod), Nod is 1.

nedel(N,C):-  M is N mod C, not(M is 0).

task15(_, 0, C, C) :- !.
task15(N, CurN, C, Count) :- ((nedel(N,CurN), not(mutsimple(N,CurN)), sumsimple(N,SSum), mutsimple(SSum, CurN))-> C1 is C + 1; C1 is C), CurN1 is CurN - 1, task15(N, CurN1, C1, Count).
task15(N, Count) :- task15(N, N, 0, Count).

%16 номер
fact16(1,CurX,CurX):-!.
fact16(N,CurX,X):-CurX1 is CurX*N, N1 is N-1, fact16(N1,CurX1,X). 
factorial16(N,X):-fact16(N,1,X).

sumfact16(0,0):-!.
sumfact16(N,X):- D is N div 10, M is N mod 10, sumfact16(D,X1), factorial16(M,Mfact), X is Mfact+X1.
sumfact16(N,X):- D is N div 10, sumfact16(D,X1), X is X1. 

truesumfact16(N,SumfactN):- N =:= SumfactN.

factorion(2540160,Sum, Sum):-!.
factorion(N, Sum, X):- ((sumfact16(N, SumfactN), truesumfact16(SumfactN,N))-> Sum1 is Sum+N; Sum1 is Sum), N1 is N+1, factorion(N1,Sum1,X).
sumfactorion(N,X):-factorion(N,0,X).



