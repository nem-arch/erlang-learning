% spawn some processes that wait for random time and die off sending a signal
-module(drones).
-export([run/0, ping/1]).

ping(Parent) ->
	random:seed(now()),
	R = random:uniform(100000) rem 10000,
	Parent ! {self(), R},
	timer:sleep(R),
	Parent ! {self(), died}.

incoming(Pids) when length(Pids) =:= 0 -> true;
incoming(Pids) ->
	receive
		{From, died} ->
			io:format("died: ~p~n",[From]),
			incoming(lists:delete(From, Pids));
		{From, Msg} ->
			io:format("ping: from ~p saying ~p~n", [From,Msg]),
			incoming(Pids)
	after
		10000 -> {timeout, Pids}
	end.

run() ->
	incoming([ spawn(drones, ping, [self()]) || _ <- lists:seq(1,100) ]).
