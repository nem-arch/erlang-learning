-module(fileop).
-export([run/0]).

run() ->
	{ok, CWD} = file:get_cwd(),
	{ok, FLIST} = file:list_dir(CWD),
	[ File || File <- FLIST, string:str(File, ".erl") > 0 ].
