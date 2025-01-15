; 2. Write a function that returns the sum of numeric atoms in a list, at any level.
; sum-numeric-atoms((l1, ..., ln)) =
; { 0, if n == 0
; { l1, if l1 is a number
; { 0, if l1 is an atom but not a number
; { sum-numeric-atoms(l1) U ... U sum-numeric-atoms(ln), if l1 is a list

(defun sum-numeric-atoms (list)
    (cond
        ; n == 0
        ((null list)
            0
        )
        ; l1 is a number
        ((numberp list)
            list
        )
        ; l1 is an atom but not a number
        ((atom list)
            0
        )
        (t
            (reduce #'+ (mapcar #'sum-numeric-atoms list))
        )
    )
)
