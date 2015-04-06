-module(comp).
-export([parse/1]).

parse([]) -> [];
parse(L) -> parse(L,[]).
parse([],Acc) -> lists:reverse(Acc);
parse([H|T],Acc) when (H >= $0) and (H =< $9) -> parse_num([H|T],Acc);
parse([H|T],Acc) ->
	case H of
		$( -> parse(T,['('|Acc]);
		$) -> parse(T,[')'|Acc]);
		$* -> parse(T,['*'|Acc]);
		$/ -> parse(T,['/'|Acc]);
		$- -> parse(T,['-'|Acc]);
		$+ -> parse(T,['+'|Acc]);
		$~ -> parse(T,['~'|Acc])
	end.

parse_num([],Acc) -> parse([],Acc);
parse_num([H|T],Acc) when H =:= $. -> parse_decimal(T,Acc,1);
parse_num([H|T],[{num,N}|Acc]) when (H >= $0) and (H =< $9) -> parse_num(T,[{'num',H-$0+N*10}|Acc]);
parse_num([H|T],Acc) when (H >= $0) and (H =< $9) -> parse_num(T,[{'num',H-$0}|Acc]);
parse_num(L,Acc) -> parse(L,Acc).

parse_decimal([],[{num,N}|Acc],Depth) -> parse([],[{num,N/Depth}|Acc]);
parse_decimal([H|T],[{num,N}|Acc],Depth) when (H >= $0) and (H =< $9) -> parse_decimal(T,[{'num',H-$0+N*10}|Acc],Depth*10);
parse_decimal(L,[{num,N}|Acc],Depth) -> parse(L,[{num,N/Depth}|Acc]).
