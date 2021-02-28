sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein1:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).


pr_ein2:-Hair=[_,_,_],
    
    			in_list(Hair,[belokurov,_]),
    			in_list(Hair,[chernov,_]),
    			in_list(Hair,[rizhov,_]),
    			in_list(Hair,[_,brunet]),
				in_list(Hair,[_,red]),
    			in_list(Hair,[_,blond]),
				not(in_list(Hair,[belokurov,blond])),
    			not(in_list(Hair,[belokurov,brunet])),
    			not(in_list(Hair,[rizhov,red])),
    			not(in_list(Hair,[chernov,brunet])),
		write(Hair).


pr_ein3:- Outfit=[_,_,_],

    			in_list(Outfit,[natasha,_,green]),
    			in_list(Outfit,[anya,_,_]),
			in_list(Outfit,[valya,_,_]),
				
    			in_list(Outfit,[_,white,_]),
			in_list(Outfit,[_,green,_]),
    			in_list(Outfit,[_,blue,_]),
    		
    			in_list(Outfit,[_,_,white]),
    			in_list(Outfit,[_,_,blue]),

			(in_list(Outfit,[anya,green,green]);
			in_list(Outfit,[anya,white,white]);
			in_list(Outfit,[anya,blue,blue])),

			not(in_list(Outfit,[valya,white,_])),
			not(in_list(Outfit,[valya,_,white])),
			not(in_list(Outfit,[valya,white,white])),

			not(in_list(Outfit,[valya,green,green])),
			not(in_list(Outfit,[valya,white,white])),
			not(in_list(Outfit,[valya,blue,blue])),

			not(in_list(Outfit,[natasha,green,green])),
			not(in_list(Outfit,[natasha,white,white])),
			not(in_list(Outfit,[natasha,blue,blue])),
    
			write(Outfit).


pr_ein4:- Friends=[_,_,_],

				
				in_list(Friends,[ivanov,_,_]),
				in_list(Friends,[borisov,_,_]),
				in_list(Friends,[semenov,_,3]),
				
    			in_list(Friends,[_,slesar,1]),
				in_list(Friends,[_,tokar,_]),
				in_list(Friends,[_,svarka,_]),
    			
    			in_list(Friends,[_,_,2]),
    			
    			
    			not(in_list(Friends,[borisov,slesar,_])),
    			not(in_list(Friends,[semenov,tokar,_])),
    			
         write(Friends).

pr_ein5:- Napitki = [_,_,_,_],

				in_list(Napitki,[bottle,_]),
				in_list(Napitki,[glass,_]),
				in_list(Napitki,[jug,_]),
				in_list(Napitki,[can,_]),

				in_list(Napitki,[_,milk]),
				in_list(Napitki,[_,lemonade]),
				in_list(Napitki,[_,kvas]),
				in_list(Napitki,[_,water]),

				not(in_list(Napitki,[bottle,milk])),
				not(in_list(Napitki,[bottle,water])),

				not(in_list(Napitki,[jug,lemonade])),
				not(in_list(Napitki,[jug,kvas])),

				not(in_list(Napitki,[can,lemonade])),
				not(in_list(Napitki,[can,water])),

				not(in_list(Napitki,[glass,milk])),
				not(in_list(Napitki,[can,milk])),

				write(Napitki).



pr_ein6:- Talents = [_,_,_,_],

				in_list(Talents,[pavlov,_]),
				in_list(Talents,[levickiy,_]),
				in_list(Talents,[voronov,_]),
				in_list(Talents,[saharov,_]),


				in_list(Talents,[_,writer]),
				in_list(Talents,[_,dancer]),
				in_list(Talents,[_,artist]),
				in_list(Talents,[_,singer]),

				not(in_list(Talents,[voronov,singer])),
				not(in_list(Talents,[levickiy,singer])),
				not(in_list(Talents,[pavlov,writer])),
				not(in_list(Talents,[pavlov,artist])),
				not(in_list(Talents,[saharov,writer])),
				not(in_list(Talents,[voronov,writer])),
				not(in_list(Talents,[voronov,artist])),

				write(Talents).











