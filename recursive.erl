-module(recursive).
-export([
 fac/1,
 len/1,
 tail_fact/1,
 dup/2,
 tail_dup/2,
 rev/1,
 tail_rev/1,
 sublist/2,
 tail_sublist/2,
 xtail_sublist/2,
 zip/2,
 tail_zip/2,
 lenient_zip/2,
 tail_lenient_zip/2,
 quicksort/1
]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0  -> N*fac(N-1).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_fact(N) -> tail_fact(N, 1).
tail_fact(0, Acc) -> Acc;
tail_fact(N, Acc) -> tail_fact(N-1, N * Acc).

dup(0, _) -> [];
dup(N, X) when N > 0 -> [X | dup(N-1, X)].

tail_dup(N, X) -> tail_dup(N, X, []).
tail_dup(0, _, Acc) -> Acc;
tail_dup(N, X, Acc) -> tail_dup(N-1, X, [X | Acc]).

rev([]) -> [];
rev([H | T]) -> rev(T)++[H].

tail_rev(L)-> tail_rev(L, []).
tail_rev([], Acc) -> Acc;
tail_rev([H | T], Acc) -> tail_rev(T, [H] ++ Acc).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H | T], N) when N > 0 -> [H] ++ sublist(T, N-1).

tail_sublist(L, N) -> tail_sublist(L, N, []).
tail_sublist(_, 0, Acc) -> Acc;
tail_sublist([], _, Acc) -> Acc;
tail_sublist([H | T], N, Acc) when N > 0 -> tail_sublist(T, N-1, Acc ++ [H]).

xtail_sublist(L, N) -> lists:reverse(xtail_sublist(L, N, [])).
xtail_sublist(_, 0, SubList) -> SubList;
xtail_sublist([], _, SubList) -> SubList;
xtail_sublist([H|T], N, SubList) when N > 0 -> xtail_sublist(T, N-1, [H|SubList]).

zip([],[]) -> [];
zip([H1 | T1], [H2 | T2]) -> [{H1, H2}|zip(T1, T2)].

tail_zip(L1, L2) -> lists:reverse(tail_zip(L1, L2, [])).
tail_zip([], [], Acc) -> Acc;
tail_zip([H1 | T1], [H2 | T2], Acc) -> tail_zip(T1, T2, [{H1, H2} | Acc]).

lenient_zip([], _) -> [];
lenient_zip(_, []) -> [];
lenient_zip([H1 | T1], [H2 | T2]) -> [{H1, H2} | lenient_zip(T1, T2)].

tail_lenient_zip(L1, L2) -> lists:reverse(tail_lenient_zip(L1, L2, [])).
tail_lenient_zip([], _, Acc) -> Acc;
tail_lenient_zip(_, [], Acc) -> Acc;
tail_lenient_zip([H1 | T1], [H2 | T2], Acc) -> tail_lenient_zip(T1, T2, [{H1, H2} | Acc]).

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot, Rest, [], []),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).






