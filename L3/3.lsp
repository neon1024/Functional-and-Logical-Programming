; 3. Define a function to tests the membership of a node in a n-tree represented as (root list_of_nodes_subtree1 ... list_of_nodes_subtreen) Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => true

(defun contains-node (tree node)
    (cond
        ((null tree) 0)
        ((and (atom tree) (eq tree node) 1))
        ((atom tree) 0)
        (t
            ; get 0 or 1 everytime
            (min 1 (max 0 (reduce #'+ (mapcar (lambda (x) (contains-node x node)) tree))))
        )
    )
)
