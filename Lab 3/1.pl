% Base case: if N = 0, the only subset is the empty list.
subsets_of_size(0, _, []).

% Recursive case 1: pick an element from the list and include it in the subset,
% then find the remaining N-1 elements from the rest of the list.
subsets_of_size(N, [H|T], [H|Subset]) :-
    N > 0,
    N1 is N - 1,
    subsets_of_size(N1, T, Subset).

% Recursive case 2: skip the current element and look for the N elements in the rest of the list.
subsets_of_size(N, [_|T], Subset) :-
    N > 0,
    subsets_of_size(N, T, Subset).

% Main predicate: generate all subsets of size N from a given list.
generate_subsets_of_size(N, List, Subsets) :-
    findall(Subset, subsets_of_size(N, List, Subset), Subsets).
