%Tail recursion for reverse

fast_reverse(Original , Result) :-
	nonvar(Original),
	fast_reverse_aux(Original, [] , Result).
	
fast_reverse_aux([H|T] , Stack , Result) :-

	is_list(H),
	fast_reverse_aux(H , [] , HResult1),
	append(HResult1,Stack,NewStack),
	fast_reverse_aux(T,NewStack, Result).
	
fast_reverse_aux([H|T] , Stack , Result) :-
	\+ is_list(H),
	fast_reverse_aux(T,[H|Stack] , Result).
	
fast_reverse_aux([] , Result , Result).

%Fibonacci Tail recursion

fibonacci(0,0).
fibonacci(1,1).

fibonacci(N,F) :- 
	fibonacci_aux(N,F,2,1,1).
	
fibonacci_aux(N,F,N,F,_).

fibonacci_aux(N,F,I,J,K) :-
	I<N,
	NewJ is J+K,
	NewI is I+1,
	fibonacci_aux(N,F,NewI,NewJ,J).
	
%Tail recusrsive version of flatten.

my_flatten(List, Result) :-
	my_flatten_aux(List, [] ,Result).
	
my_flatten_aux([],Result,Result).	

my_flatten_aux([H|T] , Stack , Result) :-
	\+ is_list(H),
	append(Stack,[H],TempResult),
	my_flatten_aux(T,TempResult,Result).
	
my_flatten_aux([H|T] , Stack , Result) :-
	is_list(H),
	my_flatten_aux(H,Stack,HeadResult),
	my_flatten_aux(T,HeadResult,Result).
	
%Tail recursive intersect

my_intersect(List1,List2,Intersect, Length) :-
	my_intersect_aux(List1,List2,[],0,Intersect,Length).

my_intersect_aux([], _ , Intersect , Length ,Intersect , Length).
	
my_intersect_aux([H|T] , List2 ,Stack , TLength, Intersect , Length) :-
	member(H,List2),
	NewLen is TLength+1,
	my_intersect_aux(T,List2,[H|Stack],NewLen,Intersect,Length).
	
my_intersect_aux([H|T] , List2 ,Stack , TLength, Intersect , Length) :-
	\+ member(H,List2),
	my_intersect_aux(T,List2,Stack,TLength, Intersect, Length).
	
%Count all occurences of element in tail recursion

count_all(E, List , Count) :-
	count_all_aux(E , List , 0, Count).

count_all_aux(_, [] , Accumulator , Accumulator).

count_all_aux(E,[E|T],Accumulator,Count):-
	NewLen is Accumulator + 1,
	count_all_aux(E,T,NewLen,Count).
	
count_all_aux(E,[H|T],Accumulator,Count):-
	E \== H,
	count_all_aux(E,T,Accumulator,Count).


%Divide lists

divide_list(L,List1, List2) :- 
	divide_list_aux(L , [] , List1 , [], List2 ).
	
divide_list_aux([H] , List1 ,[H|List1] , List2 , List2).
divide_list_aux([] , List1 , List1 , List2 , List2).	
divide_list_aux([H1,H2|T] , Acc1, List1 ,Acc2 , List2 )	:- 
	append(Acc1,[H1],NAcc1),
	append(Acc2,[H2],NAcc2),
	divide_list_aux(T,NAcc1,List1, NAcc2,List2).

	




	