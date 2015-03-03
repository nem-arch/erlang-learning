-module(ftest).

% callable functions
-export([poll/0, pull/0]).

% get every line and append to list until eof, then return list
getall(Device, Acc) ->
	case io:get_line(Device,"") of
		eof -> file:close(Device), lists:reverse(Acc);
		Line -> getall(Device, lists:reverse(Line, Acc))
	end.

% read full binary content, return it
getbin(FileName) ->
	case file:read_file(FileName) of
		{ok, Bin} -> Bin;
		{error, Reason} -> {Reason, FileName}
	end.

% cat file (binary)
pull(FileName) ->
	getbin(FileName).

pull() ->
	pull('test.file').

% cat file (ascii)
poll(FileName) ->
	case file:open(FileName,[read]) of
		{ok, Device} -> getall(Device,[]);
		{error, Reason} -> {Reason, FileName}
	end.

poll() ->
	poll('test.file').

