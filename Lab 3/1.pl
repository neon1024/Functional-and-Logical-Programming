% subsets_of_size(N-number, L-list, R-list)

% subsets_of_size(i, i, o)

% subsets_of_size(N, (l1, ..., ln)) =
% { [], if N == 0
% { [l1] U subsets_of_size(N - 1, (l2, ..., ln)), if N > 0
% { subsets_of_size(N, (l2, ..., ln)), otherwise

% base case: N = 0, the only subset is the empty list
subsets_of_size(0, _, []).

% recursive case 1: pick an element from the list and include it in the subset,
% then find the remaining N-1 elements from the rest of the list.
subsets_of_size(N, [H|T], [H|Subset]) :-
    N > 0,
    N1 is N - 1,
    subsets_of_size(N1, T, Subset).

% recursive case 2: skip the current element and look for the N elements in the rest of the list.
subsets_of_size(N, [_|T], Subset) :-
    N > 0,
    subsets_of_size(N, T, Subset).

% main predicate: generate all subsets of size N from a given list.
generate_subsets_of_size(N, List, Subsets) :-
    % collect a Subset by solving subsets_of_size(...) and add it to Subsets
    % the result of subsets_of_size(...) is stored into Subset and each one is added to Subsets
    findall(Subset, subsets_of_size(N, List, Subset), Subsets).
