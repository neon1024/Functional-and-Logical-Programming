% 9. Write a predicate to remove all recurring elements from a list of numbers L.

% remove all the elements of a list which appear more than once
% remove_repetitives(L-list, R-list)
% remove_repetitives(i, o)
% remove_repetitives((l1, ..., ln)) =
% { [], if n = 0
% { l1 U remove_repetitives((remove(l1, ..., ln), l1)), if apps((l1, ..., ln), l1) > 1
% { l1 U remove_repetitives((l2, ..., ln)), if apps((l1, ..., ln), l1) = 1

% base case: when the provided list is empty
remove_repetitives([], []).

% case when the element only appears once
remove_repetitives([H|T], [H|R]) :-
	apps([H|T], H, 1),
	remove_repetitives(T, R).

% case when the element appears more than once
remove_repetitives([H|T], R) :-
	apps([H|T], H, A),
	A > 1,
	remove([H|T], H, NewR),
	remove_repetitives(NewR, R).

% custom test case: remove_repetitives([1, 2, 3, 4, 5, 1, 2, 3, 4]) -> [5]

% remove(L-list, A-atom, R-list)
% remove(i, i, o)
% remove((l1, ..., ln), a) =
% { [], if n = 0
% { l1 U remove((l2, ..., ln), a), if l1 =/= a
% { remove((l2, ..., ln), a), if l1 = a

% base case: n = 0, when the provided list is empty
remove([], _, []).

% case: l1 = a, when the first element is the one that needs to be removed
remove([H|T], H, R) :-
	remove(T, H, R).

% case: l1 =/= a, when we skip the first element and continue with the rest
remove([H|T], A, [H|R]) :-
	H =\= A,
	remove(T, A, R).

% custom test case: remove([1, 2, 1, 2, 1, 2, 12], 2) -> [1, 1, 12]

% return the number of occurences of an element in a list
% apps(L-list, A-atom, R-list)
% apps(i, i, o)
% apps((l1, ..., ln), a) =
% { 0, if n = 0
% { 1 + apps((l2, ..., ln), a)), if l1 = a
% { apps((l2, ..., ln), a), if l1 =/= a

% base case: n = 0, when the provided list is empty
apps([], _, 0).

% case: l1 = a, when the first element is the one we are looking for
apps([H|T], H, R) :-
	apps(T, H, NewR),
	R is NewR + 1.

% case: l1 =/= a, when we continue with the rest
apps([H|T], A, R) :-
	H =\= A,
	apps(T, A, R).

% custom test case: apps([1, 2, 2, 1, 3, 4, 5], 1) -> 2