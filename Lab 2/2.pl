% remove_duplicates(L-list, R-list)
% remove_duplicates(i, o)
% remove_duplicates((l1, ..., ln)) =
% { [], if n = 0
% { remove_duplicates((l2, ..., ln)), if l1 is in (l2, ..., ln)
% { l1 U remove_duplicates((l2, ..., ln)), if l1 is not in (l2, ..., ln)

remove_duplicates([], []).

remove_duplicates([H|T], Result) :-
    member(H, T),
    remove_duplicates(T, Result).

remove_duplicates([H|T], [H|Result]) :-
    not(member(H, T)),
    remove_duplicates(T, Result).

% insertion_sort(L-list, R-list)
% insertion_sort(i, o)
% insertion_sort((l1, ..., ln)) =
% { [], if n = 0
% { insert(l1, (l2', ..., ln')) U insertion_sort((l2, ..., ln), otherwise

% base case: provided list is empty
insertion_sort([], []).

% otherwise
insertion_sort([H|T], SortedList) :-
    insertion_sort(T, SortedTail),
    insert(H, SortedTail, SortedList).

% insert(A-atom, L-list, R-list)
% insert(i, i, o)
% insert(a, (l1, ..., ln)) =
% { [a], if n = 0
% { [a, l1] U insert(a, (l2, ..., ln)), if a <= l1
% { [l1] U insert(a, (l2, ..., ln)), if a > l1

% base case: provided list is empty
insert(X, [], [X]).

% case: a <= l1
insert(X, [Y|T], [X,Y|T]) :-
    X =< Y.

% case: a > l1
insert(X, [Y|T], [Y|SortedT]) :-
    X > Y,
    insert(X, T, SortedT).

sort_and_remove_duplicates(List, SortedList) :-
    remove_duplicates(List, NoDuplicates),
    insertion_sort(NoDuplicates, SortedList).
