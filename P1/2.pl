% 2.
% a. Write a predicate to remove all occurrences of a certain atom from a list.
% b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has 
% n occurrences.
% Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].

% a.
% remove(L-list, A-atom, R-list)
% remove(i, i, o)
% remove((l1, ..., ln), a) =
% { [], if n = 0
% { l1 U remove((l2, ..., ln), a), if l1 =/= a
% { remove((l2, ..., ln), a), if l1 = a

remove([], _, []).

remove([H|T], A, [H|Rest]) :-
	H =\= A,
	remove(T, A, Rest).

remove([H|T], A, Rest) :-
	H =:= A,
	remove(T, A, Rest).

% b.
% make_pairs(L-list, R-list)
% make_pairs(i, o)
% make_pairs((l1, ..., ln)) =
% { [], if n = 0
% { [l1, apps((l1, ..., ln), l1)] U make_pairs(remove((l1, ..., ln), l1))

% apps(L-list, A-atom, R-number)
% apps(i, i, o)
% apps((l1, ..., ln), a) =
% { 0, if n = 0
% { 1 + apps((l2, ..., ln), a), if l1 = a
% { apps((l2, ..., ln), a), if l1 =/= a

apps([], _, 0).

apps([H|T], H, R) :-
	apps(T, H, NewR),
	R is NewR + 1.

apps([H|T], A, R) :-
	H =\= A,
	apps(T, A, R).

make_pairs([], []).

make_pairs([H|T], [Pair|Rest]) :-
	remove([H|T], H, NewList),
	apps([H|T], H, Apps),
	Pair = [H, Apps],
	make_pairs(NewList, Rest).