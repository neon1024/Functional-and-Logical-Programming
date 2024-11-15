% 3.
% a. Define a predicate to remove from a list all repetitive elements. 
% Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
% b. Remove all occurrence of a maximum value from a list on integer numbers

% a.
% remove_repetitives(L-list, OL-list, R-list)
% remove_repetitives(i, i, o)
% remove_repetitives((l1, ..., ln), (l1', ..., ln')) =
% { [], if n = 0
% { l1 U remove_repetitives((l2, ..., ln), (l1', ..., ln')), if apps((l1', ..., ln'), l1) == 1
% { remove_repetitives((l2, ..., ln), (l1', ..., ln')), if apps((l1', ..., ln'), l1) > 1

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

remove([], _, []).

remove([H|T], H, R) :-
	remove(T, H, R).

remove([H|T], A, [H|Rest]) :-
	H =\= A,
	remove(T, A, Rest).

remove_repetitives([], []).

remove_repetitives([H|T],  [H|Rest]) :-
	apps([H|T], H, Apps),
	Apps =:= 1,
	remove_repetitives(T, Rest).

remove_repetitives([H|T], R) :-
	apps([H|T], H, Apps),
	Apps > 1,
	remove([H|T], H, NewList),
	remove_repetitives(NewList, R).

% avem o problema, cand avem elemente care se repeta, le ignoram si procesam restul de elemente, dar ce facem cand dam iar de ele si sunt singurele de acest tip ramase?
% putem pastra lista originala sau putem da remove la toate elementele care se repeta, mai usor este a prima varianta, doar ca ocupa mai mult spatiu, pe cand a 2a varianta
% ia mai mult timp
% UPDATE: am incercat prima varianta in care sa pastrez lista originala dar nu a mers asa ca am folosit a 2a varianta unde sterg toate aparitiile unui element care se repeta

% b.
find_maximum([], _, 0).

find_maximum([H|T], Maximum, H) :-
	Maximum < H,
	find_maximum(T, H, H).

find_maximum([H|T], Maximum, R) :-
	Maximum >= H,
	find_maximum(T, Maximum, R).

remove_maximum([], _, []).

remove_maximum([H|T], Maximum, R) :-
	find_maximum([H|T], 0, Maximum),
	remove([H|T], Maximum, R).