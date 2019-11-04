-module(list1).
-export([
  min/1
]).

min([H|T]) -> min1(H, T).
min1(X, []) -> X;
min1(X, [H|T]) -> min1(min(X,H), T).
