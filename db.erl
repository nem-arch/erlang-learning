-module(db).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).

new() -> [].

destroy(_) -> ok.

write(Key, Element, Db) -> write_acc(Key, Element, Db, []).
write_acc(Key, _, [{Key,E}|T], Db) -> [[{Key,E}|T]|Db];
write_acc(Key, Element, [], Db) -> [{Key,Element}|Db];
write_acc(Key, Element, [H|T], Db) -> write_acc(Key, Element, T, [H|Db]).

delete(Key, Db) -> delete_acc(Key, Db, []).
delete_acc(Key, [{Key, _}|T], Db) -> delete_acc(Key, T, Db);
delete_acc(_, [], Db) -> Db;
delete_acc(Key, [H|T], Db) -> delete_acc(Key, T, [H|Db]).

read(_, []) -> {error, instance};
read(Key, [{Key,E}|_]) -> {ok, E};
read(Key,[_|T]) -> read(Key,T).

match(Element, Db) -> match_acc(Element, Db, []).
match_acc(_, [], Acc) -> Acc;
match_acc(Element, [{Key,Element}|T], Acc) -> match_acc(Element, T, [Key|Acc]);
match_acc(Element, [_|T], Acc) -> match_acc(Element, T, Acc).
