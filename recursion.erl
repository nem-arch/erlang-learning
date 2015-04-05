-module(recursion).
-export([even/1, member/2, bump/1, average/1]).

% add 1 to every element of list
bump([]) -> [];
bump(L) -> bump_acc(L,[]).
bump_acc([],L) -> lists:reverse(L);
bump_acc([H|T], L) -> bump_acc(T, [ H + 1 | L ]).

% return average of listelements
average([]) -> 0;
average(L) -> average_acc(L,0,0).
average_acc([],Sum,Len) -> Sum/Len;
average_acc([H|T],Sum,Len) -> average_acc(T, Sum+H, Len+1).

% return list of even elements
even([]) -> [];
even([H|T]) when H rem 2 == 0 -> [ H | even(T) ];
even([_|T]) -> even(T).

% return boolean, whether N is element
member(_,[]) -> false;
member(N,[N|_]) -> true;
member(N,[_|T]) -> member(N,T).
