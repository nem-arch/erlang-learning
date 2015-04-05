-module(manip).
-export([filter/2, reverse/1, cat/1, flatten/1]).

filter(L, N) -> filter_acc(L, N, []).
filter_acc([], _, L) -> L;
filter_acc([H|T], N, L) when H =< N -> filter_acc(T, N, [H|L]).

reverse(L) -> reverse_acc(L, []).
reverse_acc([], L) -> L;
reverse_acc([H|T], L) -> reverse_acc(T, [H|L]).

cat(L) -> cat_acc(L, []).
cat_acc([],L) -> L;
cat_acc([H|T],L) -> cat_acc(T, H++L).

flatten(L) -> flatten_acc(L, []).
flatten_acc([], L) -> L;
flatten_acc([H|T], L) when is_list(H) -> flatten_acc(T, flatten_acc(H, L));
flatten_acc([H|T], L) -> flatten_acc(T, [H|L]).
