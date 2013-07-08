-module('problem_5').
-export([start/1]).

% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
% N - Max factor (e.q. 20 for 1..20)

start(N) -> checkDiv(N, N, lists:seq(1, N, 1)).

checkDiv(N, Candidat, Arr) ->
    Result = lists:map(fun (Factor) -> Candidat rem Factor end, Arr),
    case lists:sum(Result) of
        0 -> Candidat;
        _Other -> checkDiv(N, Candidat + N, Arr)
    end.
