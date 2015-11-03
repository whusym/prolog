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
	