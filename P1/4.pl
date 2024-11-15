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
% { 