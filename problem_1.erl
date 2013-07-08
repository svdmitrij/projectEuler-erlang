-module('problem_1').
-export([start/1]).

start(Limit) -> sum(Limit).

sum(0) -> 0;

sum(N) when (((N rem 3) == 0) or ((N rem 5) == 0)) ->
    N + sum(N - 1);

sum(N) -> sum(N - 1).
