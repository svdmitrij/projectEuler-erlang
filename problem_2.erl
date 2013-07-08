-module('problem_2').
-export([start/1]).

start(Limit) ->
    sum(evenFiboList(33, Limit)).

sum([]) -> 0;
sum([N | Tail]) ->
	 	N + sum(Tail).

fiboList(0, _) 		-> [];
fiboList(N, List) 	-> [fibo(N)|fiboList(N - 1, List)].

evenFiboList(N, Limit) ->
	[round(X) || X <- fiboList(N, []), (even(round(X)) and (fibo(N) < Limit))].

fibo(N) -> 
    SQ5 = math:sqrt(5),
    T1 = math:pow(0.5 * (1 + SQ5), N),
    T2 = math:pow(0.5 * (1 - SQ5), N),
    (T1 - T2) / SQ5.
 
even(N) ->
	(N - trunc(N / 2) * 2) == 0.