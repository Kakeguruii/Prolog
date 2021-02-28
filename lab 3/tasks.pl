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



