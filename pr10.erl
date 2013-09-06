-module('pr10').
-export([start/0]).

start() ->
    findPrimeSum(2000000).

findPrimeSum(N) ->
    lists:sum(problem_3:get_primes(N)).
