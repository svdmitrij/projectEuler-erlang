-module('pr9').
-export([start/0]).

start() ->
    getTriplet(1000).

getTriplet(N) ->
    getTriplet(1, 1, 1, N, 0).

getTriplet(_, 998, _, _, Tr) -> Tr;
getTriplet(998, B, C, N, Tr) -> getTriplet(1,  B + 1,  C, N, Tr);
getTriplet(A, B, C, N, _Tr) ->

    case (A + B + math:sqrt(C)) == N of
        true -> io:format("~.10B~n", [round(A * B * math:sqrt(C))]);
        false -> Anew = A + 1,
                 Cnew = Anew * Anew + B * B,
                 getTriplet(Anew, B, Cnew, N, Anew * B * math:sqrt(Cnew))
    end.

