-module(problem_14).
-export([start/0]).

start() ->
  getLongestSeqAndStartNum(1, 1, 1).

nextMember(1) -> 1;
nextMember(Num) ->
  case (round(Num) rem 2 =:= 0) of
    true -> round(Num / 2);
    _ -> round(3 * Num + 1)
  end.

getSequence(1) -> [1];
getSequence(StartNum) ->
  [StartNum|getSequence(nextMember(StartNum))].

getLongestSeqAndStartNum(999999, MaxLength, BestStartNum) -> [{maxLength, MaxLength}, {bestStartNum, BestStartNum}];
getLongestSeqAndStartNum(StartNum, MaxLength, BestStartNum) ->
  Length = length(getSequence(StartNum)),
  case Length > MaxLength of
    true -> NewMaxLength = Length,
                 NewBestStartNum = StartNum,
                 getLongestSeqAndStartNum(StartNum + 1, NewMaxLength, NewBestStartNum);
    _ -> getLongestSeqAndStartNum(StartNum + 1, MaxLength, BestStartNum)
  end.