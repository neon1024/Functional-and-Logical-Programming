% 5.
% a. Write a predicate to compute the union of two sets.
% b. Write a predicate to determine the set of all the pairs of elements in a list. 
% Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]].

% a.
apps([], _, 0).

apps([H|T], A, R) :-
	H =\= A,
	apps(T, A, R).

apps([H|T], H, R) :-
	apps(T, H, NewR),
	R is NewR + 1.

set_union([], _, []).

set_union([HA|TA], [HB|TB], [HA|Rest]) :-
	apps([HB|TB], HA, Apps),
	Apps > 0,
	set_union(TA, [HB|TB], Rest).

set_union([HA|TA], [HB|TB], R) :-
	apps([HB|TB], HA, 0),
	set_union(TA, [HB|TB], R).