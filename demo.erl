-module(demo).
-export([double/1]).
-export([times/2]).
-export([fact/1]).
-export([sum/1]).

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
