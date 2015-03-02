-module(demo).
-export([double/1, times/2, fact/1, sum/1]).

double([]) ->
	[];
double([H|T]) ->
	[2*H|double(T)].

times(X, N) ->
	X * N.

fact(0) ->
	1;
fact(N) ->
	N * fact(N-1).

sum([]) ->
	0;
sum([H|T]) ->
	H + sum(T).
