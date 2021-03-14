write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),write(" "),write_list_str(T).

read_str(List):-get0(X),read_str(X,List,[]).
read_str(10,List,List):-!.
read_str(X,List,B):-append(B,[X],B1),get0(X1),read_str(X1,List,B1).

%task 1
count_chars([],CurCount,CurCount):-!.
count_chars([_|T],CurCount,CountCh):-CurCount1 is CurCount + 1, count_chars(T,CurCount1,CountCh).
count_chars(List,CountCh):-count_chars(List,0,CountCh).

task1:-
	write("Write str: "),read_str(List), write("Three str: "),
	write_str(List),write(,  ),
	write_str(List),write(,  ),
	write_str(List),write("."),nl,
	write("Count chars: "),count_chars(List,CountCh),write(CountCh).

%task 2
count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1), get_word(T,W1,Word,A2).


get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

count_words(List,Count):-count_words(List,0,Count).
task2:- write("Write str: "),read_str(List),write("Count words: "),count_words(List,Count),write(Count).

%task 3
unique_list([],[]):-!.
unique_list([H|T],T1):-member(H,T),unique_list(T,T1),!.
unique_list([H|T],[H|T1]):-not(member(H,T)),unique_list(T,T1),!.

kolEl([],_,N,N):-!.
kolEl([H|T],X,CurCount,Count):- (H = X -> CurCount1 is CurCount + 1;CurCount1 is CurCount), kolEl(T,X,CurCount1,Count).
kolEl(List,X,Count):-kolEl(List,X,0,Count).

max_word([],_,_,CurWord,CurWord):-!.
max_word([H|T],ListWord,CurCount,CurWord,Word):- kolEl(ListWord,H,CountH),(CountH > CurCount->(CurCount1 is CountH,CurWord1 = H);(CurCount1 is CurCount, CurWord1 = CurWord)),
	max_word(T,ListWord,CurCount1,CurWord1,Word).
max_word(UniListWord,ListWord,Word):-max_word(UniListWord,ListWord,0,[],Word).

task3:- write("Write str: "),read_str(List),
	count_words(List,CountW),
	get_words(List,ListWord,CountW),
	write("List words: "),write_list_str(ListWord),nl,
	unique_list(ListWord,UniListWord),
	write("Unique list words: "),write_list_str(UniListWord),nl,
	write("Max count word: "),
	max_word(UniListWord,ListWord,Word),
	write_str(Word).

%task 4
length_list([],0):-!.
length_list([_|T],X):-length_list(T,X1),X is (X1 + 1).

list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,1,N).

repeat(_, Length, Length):-!.
repeat(Elem, CurNum, Length):-append_element([],[Elem,32],List),write_str(List),write(" "),CurNum1 is CurNum+1, repeat(Elem,CurNum1,Length).
repeat(Elem,Length):-repeat(Elem,0,Length).

append_element([], X, X).
append_element([H|T1], X, [H|T2]) :- append_element(T1, X, T2).

task4:-write("Write str: "),read_str(List),
       length_list(List,Length),nl,
       write("Answer: "),
       ((Length>5)->list_el_numb(List,E1,1),
       list_el_numb(List,E2,2),list_el_numb(List,E3,3),
       Length2 is Length-1, Length3 is Length-2,
       list_el_numb(List,E4,Length3),list_el_numb(List,E5,Length2),
       list_el_numb(List,E6,Length),
	append_element([],[E1,32,E2,32,E3,32,E4,32,E5,32,E6],ListLetter),
       write_str(ListLetter);
       list_el_numb(List,E,1), repeat(E,Length)).

%task 5
write_numbers([],_,_):-!.
write_numbers([H|T],CurNum,Elem):-((H is Elem)->write(CurNum),write(" "),CurNum1 is CurNum+1;CurNum1 is CurNum+1),
write_numbers(T,CurNum1,Elem).
write_numbers(List,Elem):-write_numbers(List,1,Elem).

task5:-write("Write str: "),read_str(List),
       length_list(List,Length),nl,
       list_el_numb(List,Elem,Length),
       append_element([],[Elem],LetterList),
       write("Last elem is '"), write_str(LetterList),write("' "), nl,
       write("Numbers: "), write_numbers(List,Elem).


%task 6
del3([],_):-!.
del3([H|T],CurNum):-((0 is CurNum mod 3)->append_element([],[H],ListLetter),write_str(ListLetter),write(" "),CurNum1 is CurNum+1;
CurNum1 is CurNum+1), del3(T,CurNum1).
del3([H|T]):-del3([H|T],1).

task6:-write("Write str: "),read_str(List),nl,
	write("Answer: "),del3(List).

%task 7
count_pm([],Plus,Minus,Plus,Minus):-!.
count_pm([H|T],Plus,Minus,X,Y):-((H is 43)->Plus1 is Plus + 1;Plus1 is Plus),((H is 45)->Minus1 is Minus + 1;Minus1 is Minus), count_pm(T,Plus1,Minus1,X,Y).
count_pm([H|T],Plus,Minus):-count_pm([H|T],0,0,Plus,Minus).

count_bz([],Zero,Zero):-!.
count_bz([H|T],Zero,CountZ):-(H is 48->Zero1 is Zero + 1;Zero1 is Zero), count_bz(T,Zero1,CountZ).
count_bz([_|T],CountZ):-count_bz(T,0,CountZ).

task7:- write("Write str: "),read_str(List),nl,
	count_pm(List,Plus,Minus),
	write("Count plus: "),write(Plus),nl,
	write("Count minus: "), write(Minus), nl,
	write("Count before zero: "), count_bz(List,CountZ), write(CountZ),nl.






