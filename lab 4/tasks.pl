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

%8 задание
task8:-	write("enter the count of element: "), read(N),nl,
		write("enter list"),nl, read_list(N,List), min_list_down(List,Min),
		write("min element of list: "), write(Min),!; write("list is empty").

%9 задание
member([X|_],X):-!.
member([_|T],X):-member(T,X).

%10 задание 
reverse([],CurList,CurList):-!.
reverse([H|T],CurList,NewList):-reverse(T,[H|CurList],NewList).
reverse(L,NewList):-reverse(L,[],NewList).

%11 задание
p([],_):-!.
p(_,[]):-fail,!.
p([H|Sub_list],[H|List]):-p(Sub_list,List),!.
p(Sub_list,[_|List]):-p(Sub_list,List).

%12 задание
delete(1,[_|T],T):- !.
delete(X,[H|T1],[H|T2]) :- X1 is X-1,delete(X1,T1,T2).

%13 задание 
delete_equal([],_,[]):-!.
delete_equal([H|T],H,T1):-delete_equal(T,H,T1).
delete_equal([H|T],X,[H|T1]):-delete_equal(T,X,T1).

%14 Задание
task14([]):- !.
task14([H|T]):- not(member(T, H)), task14(T).

%15 задание
task15([],[]):-!.
task15([H|T],T1):-member(T,H),task15(T,T1),!.
task15([H|T],[H|T1]):-not(member(T,H)),task15(T,T1),!.

%16 задание
kolEl([],_,N,N):-!.
kolEl([H|T],X,N,Count):- (H is X -> N1 is (N + 1), kolEl(T,X,N1,Count);N1 is N, kolEl(T,X,N1,Count)).
kolEl([H|T],X,Count):-kolEl([H|T],X,0,Count).

%17 задание
lenght_list([],0).
lenght_list([_|T],X):-lenght_list(T,X1), X is (X1 + 1).

%1.6 задание
%предикаты
task1_6(List,0,List):-!.
task1_6(List,Count,X):-Count1 is Count-1, task1_6(List,Count1,L1), sdvig(L1,X).
task1_6(List,X):-task1_6(List,3,X).
sdvig([],L,L):-!.
sdvig([H|T],L,[H|L1]):- sdvig(T,L, L1).
sdvig([H|T],L):-sdvig(T,[H],L).
%программа
task_1_6_program:-	write("enter the count of element: "), read(N),nl,
			write("enter list"), read_list(N,List),nl,
			task1_6(List,X), write("New list: "), write(X).

%1.5 задание
%предикаты
task1_5(List,N):- min_list_up(List,Min), list_el_numb(List, Min, Numb), Numb is N,!.
%программа
task_1_5_program:-	write("enter the count of element: "), read(N),nl,
			write("enter number: "), read(X), nl,
    			write("enter list"), read_list(N,List),nl,
			task1_5(List,X), write("It's true "); write("It's false").

%1.18 задание
%предикаты
task1_18(List,X):-task1_18(List,[],X).
task1_18([H|T],NewList,NewList):- min_list_up([H|T],Min), H is Min,!.
task1_18([H|T],NewList,X):- append_element(NewList,[H],NewList1), task1_18(T,NewList1,X).
%программа
task_1_18_program:-	write("enter the count of element: "), read(N),nl,
    				write("enter list"), read_list(N,List),nl,
					task1_18(List,X), write("New list: "), write(X).











