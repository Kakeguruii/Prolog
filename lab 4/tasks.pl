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

%4.2 задание
task4_2:-	write("enter the count of element: "), read(N),nl,
			write("enter list"), read_list(N,List),nl,
			write("enter element: "), read(L),nl,
			list_el_numb(List,L,Num), write("element number: "), write(Num),!;
			write("such element isn't found").

%5 задание
task5:- 	write("enter the count of element: "), read(N),nl,
			write("enter list"), read_list(N,List),nl,
			write("enter element's number: "), read(Numb),nl,
		list_el_numb(List,L,Numb), write("element with that number: "), write(L),!;
    		write("element  with that number isn't found ").

%6 задание
min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1), (H < Min1 -> Min is H;Min is Min1).

%7 задание
min_list_down([],CurMin,CurMin):-!.
min_list_down([H|T],CurMin,Min):-(H < CurMin -> CurMin1 is H; CurMin1 is CurMin),min_list_down(T,CurMin1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).


