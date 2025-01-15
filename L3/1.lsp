;1. Write a function to check if an atom is member of a list (the list is non-liniar)
(defun contains (elements element)
    (cond
        ((null elements)
            nil
        )
        ((and (atom elements) (eq elements element))
            t
        )
        ((atom elements)
            nil
        )
        (t
            (mapcar (lambda (x) (find element x)) elements) 
        )
    )
)
