-module('problem_4').
-export([start/0]).


start() ->
    Res = for_loop (100, 999, 1),
    lists:max(lists:flatten(Res)).

for_loop (N, M, Step) ->
    Arr = lists:seq(N, M, Step),
    Acc = [],
    lists:map(
        fun (F) -> lists:map(
            fun (S) -> push_to_list_if_is_palindrome(F, S, Acc) end,
            Arr
        ) end,
        Arr
    ).

push_to_list_if_is_palindrome(N, M, Acc) ->
    Prod = N * M,
    String = integer_to_list(Prod),
    StringRev = lists:reverse(String),
    ProdRev = list_to_integer(StringRev),
    case Prod == ProdRev of
        true -> [Prod | Acc];
        false -> Acc
    end.
