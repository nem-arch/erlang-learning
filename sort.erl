-module(sort).
-export([quick/1, merge/1]).

quick([]) -> [];
quick([H|T]) -> quick([X||X<-T,X=<H]) ++ [H] ++ quick([X||X<-T,X>H]).

split(L) -> split_acc(L, L, []).
split_acc([], L1, L2) -> {L1, L2};
split_acc([_], L1, L2) -> {L1, L2};
split_acc([_,_|T], [H|T1], L2) -> split_acc(T, T1, [H|L2]).

merge([]) -> [];
merge([H]) -> [H];
merge(L) ->
	{L1, L2} = split(L),
	merge(merge(L1),merge(L2)).
merge([],L) -> L;
merge(L,[]) -> L;
merge([H1|T1],[H2|T2]) ->
	case H1=<H2 of
		true -> [H1 | merge(T1, [H2|T2])];
		false -> [H2 | merge([H1|T1], T2)]
	end.
