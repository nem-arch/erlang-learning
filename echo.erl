-module(echo).

% callable functions
-export([go/0, loop/0]).

go() ->
	% spawn loop from echo module (this one) in a separate process
	Pid2 = spawn(echo, loop, []),
	% send a tuple containing own pid and an atom
	Pid2 ! {self(), hello},
	% wait for incoming and print it
	receive
		{Pid2, Msg} ->
			io:format("P1 ~w~n",[Msg])
	end,
	% send atom 'stop' to spawned process
	Pid2 ! stop.

loop() ->
	% wait for incoming
	receive
		% throw it back to sender
		{From, Msg} ->
			From ! {self(), Msg},
			loop();
		% exit if incoming is 'stop'
		stop ->
			true
	end.
