% 4.
% a. Write a predicate to determine the difference of two sets.
% b. Write a predicate to add value 1 after every even element from a list.

% a.
% set_diff(A-list, B-list, R-list)
% set_diff(i, i, o)
% set_diff((a1, ..., an), (b1, ..., bm)) =
% { [a1, ..., an], if m = 0
% { [b1, ..., bm], if n = 0
% { [], if n = 0, m = 0
% { a1 U set_diff((a2, ..., an), (b1, ..., bm)), if apps((b1, ..., bm), a1)) = 0
% { set_diff((a2, ..., an), (b1, ..., bm)), if apps((b1, ..., bm), a1)) > 0

% apps(L-list, A-atom, R-number)
% apps(i, i, o)
% apps((l1, ..., ln), a)) =
% { 0, if n = 0
% { 1 + apps((l2, ..., ln), a)), if l1 = a
% { apps((l2, ..., ln), a), if l1 =/= a

apps([], _, 0).

apps([H|T], H, R) :-
	apps(T, H, NewR),
	R is NewR + 1.

apps([H|T], A, R) :-
	H =\= A,
	apps(T, A, R).

set_diff(_, [], []).

set_diff([], _, []).

set_diff([], [], []).

set_diff([HA|TA], [HB|TB], [HA|Rest]) :-
	apps([HB|TB], HA, Apps),
	Apps =:= 0,
	set_diff(TA, [HB|TB], Rest).

set_diff([HA|TA], [HB|TB], R) :-
	apps([HB|TB], HA, Apps),
	Apps > 0,
	set_diff(TA, [HB|TB], R).

% b.
% add_one_after_evens(L-list, R-list)
% add_one_after_evens(i, o)
% add_one_after_evens((l1, ..., ln)) =
% { [], if n = 0
% { [l1, 1] U add_one_after_evens((l2, ..., ln)), if l1 mod 2 = 0
% { l1 U add_one_after_evens((l2, ..., ln)), if l1 mod 2 =/= 0

is_even(A) :-
	0 is A mod 2.

add_one_after_evens([], []).

add_one_after_evens([H|T], [H,H1|Rest]) :-
	is_even(H),
	H1 is 1,
	add_one_after_evens(T, Rest).

add_one_after_evens([H|T], [H|Rest]) :-
	not(is_even(H)),
	add_one_after_evens(T, Rest).