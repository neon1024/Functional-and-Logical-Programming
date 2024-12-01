% 2. 
% a. Sort a list with keeping double values in resulted list. E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]

% Inserts an element into a sorted list in the correct position
% insert(Element-atom, SortedList-list, ResultList-list)
% insert(i, i, o)
% insert(x, (l1, ..., ln)) =
% {
%	[x], if n = 0
%	l1 U insert(x, (l2, ..., ln)), if x > l1
%	[x,l1], if x <= l1
% }

% base case: empty list
insert(X, [], [X]).

insert(X, [H|T], [X,H|T]) :-
	X =< H.

insert(X, [H|T], [H|R]) :-
	X > H,
	insert(X, T, R).

% Sorts the list using insertion sort
% insertion_sort(List-list, SortedList-list)
% insertion_sort(i, o)
% insertion_sort((l1, ..., ln)) =
% {
%	[], if n = 0
%	insert(l1, (insertion_sort((l2, ..., ln)))
% }

% base case: empty list is already sorted
insertion_sort([], []).  

insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedTail),
    insert(H, SortedTail, Sorted).

% b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every sublist, keeping the doubles.
% Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] => [1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].

% Sort each sublist in a heterogeneous list
% sort_heterogeneous(List-list, SortedList-list)
% sort_heterogeneous(i, o)
% sort_heterogeneous((l1, ..., ln)) =
% {
%	[], if n = 0
%	insertion_sort(l1, (l2, ..., ln)) U sort_heterogeneous((l2, ..., ln)), if l1 is a list
%	l1 U sort_heterogeneous((l2, ..., ln)), if l1 is not a list
% }

% base case: empty list
sort_heterogeneous([], []).

% if the head is a list, sort it and continue with the tail
sort_heterogeneous([Head|Tail], [SortedHead|SortedTail]) :-
    is_list(Head),  % Check if the head is a sublist
    insertion_sort(Head, SortedHead),
    sort_heterogeneous(Tail, SortedTail).

% if the head is not a list, leave it as it is and continue with the tail
sort_heterogeneous([Head|Tail], [Head|SortedTail]) :-
    not(is_list(Head)),
    sort_heterogeneous(Tail, SortedTail).
