-module(demo).

% callable functions
-export([double/1, times/2, fact/1, sum/1]).

% param: list
% return: list with entries doubled
double([]) ->
	[];
double([H|T]) ->
	[2*H|double(T)].

% times as in multiply
times(X, N) ->
	X * N.

% factorial
fact(0) ->
	1;
fact(N) ->
	N * fact(N-1).

% param: list
% return: sum of list elements
sum([]) ->
	0;
sum([H|T]) ->
	H + sum(T).
