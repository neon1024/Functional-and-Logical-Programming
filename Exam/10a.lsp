(DEFUN F(N)
(COND
((= N 0) 0)
(T ((lambda (X)
(cond
((> X 1) (- N 2))
(T (+ X 1))
)
) (F (- N 1)))
)
)
)