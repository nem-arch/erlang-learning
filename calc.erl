#!/usr/bin/env escript
% small math console for arbitrary bases
%
% main purpose is to calc in arbitrary bases with solution in arb bases
% this is interpreting erlang, so don't forget the dot!
% > 16#B * 5.
% h 37
% d 55
% b 110111
% o 67
%
% calling math functions is also possible, i.e.:
% > A=math:sqrt(2), A*2.
% f 2.828427
%
% q to quit
% > q.

-export([main/1]).

-mode(native).

main(_) ->
	run().

eval(Line,Environ) ->
	{ok,Tokens,_} = erl_scan:string(Line),
	{ok,ExprList} = erl_parse:parse_exprs(Tokens),
	erl_eval:exprs(ExprList,Environ).

run() ->
	try eval( string:strip( io:get_line("> "), right, $\n), []) of
		{_,N,_} when is_integer(N) ->
			io:format("h ~.16B~n", [N]),
			io:format("d ~.10B~n", [N]),
			io:format("b ~.2B~n", [N]),
			io:format("o ~.8B~n", [N]);
		{_,N,_} when is_float(N) ->
			io:format("f ~f~n", [N]);
		{_,N,_} when N =:= q -> halt()
	catch
		Throw -> io:format("~p ~p ~p~n",[throw,caught,Throw]);
		error:Error -> io:format("~p ~p ~p~n",[error,caught,Error])
	after
		run()
	end.
