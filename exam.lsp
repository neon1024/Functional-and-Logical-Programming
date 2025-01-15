; 15. Define a function that returns the least common multiple of the numeric atoms in a non-linear list. Example: (12 2 4 6 8) -> 24

; g-c-d(a, b) =
; { a, if b == 0
; { g-c-d(b, a%b), otherwise

; compute the greatest common divisor of two numbers
(defun g-c-d (a b)
    (if (= b 0)
        a
        (g-c-d b (mod a b))
    )
)

; l-c-m(a, b) =
; { |a*b / g-c-d(a, b)|

; compute the least common multiple of 2 numbers
(defun l-c-m (a b)
    ; |a*b / gcd(a, b)|
    (abs (/ (* a b) (g-c-d a b)))
)

; flatten-and-extract-numbers(L) =
; { NULL, if L is null
; { [L], if L is a number
; { NULL, if L is an atom but not a number
; { flatten-and-extract-numbers(L1) U flatten-and-extract-numbers(L2, ..., Ln), otherwise L is a list

; recursively flatten the list and extract only the numbers
(defun flatten-and-extract-numbers (L)
    (cond
        ; base case: n is null, return nothing
        ((null L) nil)
        
        ; case: L is an atom
        ((atom L)
            ; if L is a number return [L]
            (if (numberp L)
                (list L)
                ; else return nothing
                nil
            )
        )
        
        ; otherwise, L must be a list, so continue flattening it
        (t
            (append
                (flatten-and-extract-numbers (car L))
                (flatten-and-extract-numbers (cdr L))
            )
        )
    )
)

; solve(L) =
; { NULL, if there are no numbers in the list
; { l-c-m(l-c-m(l-c-m(l-c-m(L1), l-c-m(L2)), l-c-m(L3)), ..., l-c-m(Ln)), otherwise

; compute the least common multiple of all numbers in a non-linear list
(defun solve (L)
    ; extract the numbers first
    (let ((nums (flatten-and-extract-numbers L)))
        (if (null nums)
            ; no numbers found, return nothing
            nil
            ; compute the lcm on all the numbers
            (reduce #'l-c-m nums)
        )
    )
)
