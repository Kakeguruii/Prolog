%1 задание
append_element([], X, X).
append_element([H|T1], X, [H|T2]) :- append_element(T1, X, T2).


read_list(N, L) :- read_list(N, 0, [], L), !.
read_list(N, N, L, L) :- !.
read_list(N, CurN, CurL, L) :- CurN1 is CurN + 1, read(X), append_element(CurL, [X], CurL1), read_list(N, CurN1, CurL1, L).

write_list([]) :- !.
write_list([H|T]) :- write(H), write(" "), write_list(T).

%2 задание
sum_list_down([],Sum,Sum):-!.
sum_list_down([H|T],CurSum,Sum):- CurSum1 is CurSum + H, sum_list_down(T, CurSum1, Sum).
sum_list_down([H|T], Sum):- sum_list_down([H|T], 0, Sum).

%3 задание
sum_list_up([], 0) :- !.
sum_list_up([H|T], Sum) :- sum_list_up(T, Sum1), Sum is Sum1 + H.

%4 задание
list_el_numb([H|_],H,CurN,CurN):-!.
list_el_numb([_|T],Elem,CurN,N):-CurN1 is CurN+1,list_el_numb(T,Elem,CurN1,N).
list_el_numb([H|T],Elem,N):-list_el_numb([H|T],Elem,1,N).

