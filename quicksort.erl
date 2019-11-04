-module(quicksort).
-export([sort/1, lc_sort/1]).

sort([]) -> [];
sort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot,Rest,[],[]),
  sort(Smaller) ++ [Pivot] ++ sort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
     H >  Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.

lc_sort([]) -> [];
lc_sort([Pivot|Rest]) ->
  lc_sort([Smaller || Smaller <- Rest, Smaller =< Pivot])
  ++ [Pivot] ++
  lc_sort([Larger || Larger <- Rest, Larger > Pivot]).
