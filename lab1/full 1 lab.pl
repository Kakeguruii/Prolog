man(lesha).
man(maxim).
man(nikita).
man(kirill).
man(petya).
man(misha).
man(pasha).
man(danil).
man(dima).
man(kolya).
man(egor).
man(artyom).
man(andrey).
man(svyat).

woman(liza).
woman(katya).
woman(ksenia).
woman(lena).
woman(anya).
woman(olya).
woman(sveta).
woman(alyona).
woman(sofa).
woman(lusya).
woman(dasha).
woman(masha).
woman(toma).
woman(ira).

parent(liza,nikita).
parent(liza,lena).
parent(liza,anya).
parent(liza,kirill).
parent(lesha,nikita).
parent(lesha,lena).
parent(lesha,anya).
parent(lesha,kirill).

parent(katya,olya).
parent(katya,sveta).
parent(maxim,olya).
parent(maxim,sveta).

parent(ksenia,petya).
parent(nikita,petya).
parent(ksenia,toma).
parent(ksinia,ira).
parent(nikita,toma).
parent(nikita,ira).

parent(olya,misha).
parent(olya,pasha).
parent(kirill,misha).
parent(kirill,pasha).

parent(alyona,sofa).
parent(misha,sofa).

parent(sofa,dima).
parent(sofa,kolya).
parent(sofa,egor).
parent(danil,dima).
parent(danil,kolya).
parent(danil,egor).

parent(lusya,ksenia).
parent(artyom,ksenia).

parent(dasha,alyona).
parent(andrey,alyona).

parent(masha,danil).
parent(svyat,danil).




mans:-man(X),write(X),write(" "),fail.
womans:-woman(X),write(X),write(" "),fail.

children(X):-parent(X,Y),write(Y),write(" "),fail.

mother(X,Y):-woman(X),parent(X,Y).
mother(X):-parent(Y,X),woman(Y),write(Y).

daughter(X,Y):-woman(X),parent(Y,X).
daughter(X):-parent(X,Y),woman(Y),write(Y),write(" "),fail.

brother(X,Y):-man(X),parent(Z,X),parent(Z,Y).
brothers(X):-parent(Z,X),parent(Z,Y),man(Z),man(Y),not(Y=X),write(Y),write(" "),fail.

husband(X,Y):-man(X),woman(Y),parent(X,Z),parent(Y,Z).
husband(X):-woman(X),man(Y),parent(X,Z),parent(Y,Z),write(Y).

b_s(X,Y):-parent(Z,Y),parent(Z,X).
b_s(X):-parent(Z,X),parent(Z,Y),man(Z),not(Y=X),write(Y),write(" "),fail.

grand_pa(X,Y):-man(X),parent(X,Z),parent(Z,Y).
grand_pas(X):-parent(Y,X),parent(Z,Y),man(Z),write(Z),write(" "),fail.

grand_so(X,Y):-man(X),parent(Z,X),parent(Y,Z).
grand_sons(X):-parent(X,Y),parent(Y,Z),man(Z),write(Z),write(" "),fail.

grand_pa_and_son(X,Y):-(parent(X,Z),parent(Z,Y),man(X),man(Y))|(parent(Z,X),parent(Y,Z),man(X),man(Y)).

grand_ma_and_da(X,Y):-(parent(X,Z),parent(Z,Y),woman(X),woman(Y))|(parent(Z,X),parent(Y,Z),woman(X),woman(Y)).


uncle(X,Y):-parent(Z,X),parent(Z,N),parent(N,Y),man(X).
uncle(X):-parent(Z,X),parent(N,Z),parent(N,Y),man(N),man(Y),not(Y=Z),write(Y),write(" "),fail.

niece(X,Y):- parent(Z,Y),man(Z), parent(Z,M),parent(M,X),man(M),woman(X).
niece(X):- parent(Z,X),man(Z),parent(Z,M),parent(M,Y),man(M),woman(Y),not(X=M), write(Y), write(" "), fail.

