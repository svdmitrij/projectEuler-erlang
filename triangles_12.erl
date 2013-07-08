-module('triangles_12').
-compile(export_all).

start(N)->
    getNOD(N, 2, []).

getNOD(Num, F, List) when Num > 1 ->
    case Num rem F of
    0 ->
        [getNOD(Num div F, F, List)|List];
    _Else ->
        [getNOD(Num, F + 1, List)|List]
    end;

getNOD(_Num, _F, List) ->
    % io:format("result: ~p~n", List).
    List.
