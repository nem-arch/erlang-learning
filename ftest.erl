-module(ftest).

-export([poll/0, pull/0]).


getall(Device, Acc) ->
	case io:get_line(Device,"") of
		eof -> file:close(Device), lists:reverse(Acc);
		Line -> getall(Device, lists:reverse(Line, Acc))
	end.

getbin(FileName) ->
	case file:read_file(FileName) of
		{ok, Bin} -> Bin;
		{error, Reason} -> {Reason, FileName}
	end.

pull(FileName) ->
	getbin(FileName).

pull() ->
	pull('test.file').

poll(FileName) ->
	case file:open(FileName,[read]) of
		{ok, Device} -> getall(Device,[]);
		{error, Reason} -> {Reason, FileName}
	end.

poll() ->
	poll('test.file').

