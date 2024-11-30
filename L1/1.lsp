; 1.
; a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.

; nth-elem-of(N-number, L-list)
; nth-elem-of(N, (l1, ..., ln)) =
; { NIL, if n == 0 or N > n
; { nth-elem-of(N-1, (l2, ..., ln)), if N > 1
; { l1, if N == 1

(defun nth-elem-of (N L)
	(cond
		((or (= 0 (length L)) (> N (length L)))
			nil
		)
		((> N 1)
			(nth-elem-of (- N 1) (cdr L))
		)
		(t
			(car L)
		)
	)
)

(defun print-nth-elem-of (N Elems)
  (format t "~Ath element of ~a is: ~A~%" N Elems (nth-elem-of N Elems))
)

(defun run-tests ()
  (format t "4th element of [1, 2, 3] is: ~A, expected NIL~%" (nth-elem-of 4 `(1 2 3)))
  (format t "3th element of [1, 2, 3] is: ~A, expected 3~%" (nth-elem-of 3 `(1 2 3)))
  (format t "1th element of [1, 2, 3] is: ~A, expected 1~%" (nth-elem-of 1 `(1 2 3)))
  (format t "1th element of [] is: ~A, expected NIL~%" (nth-elem-of 1 `()))
)

(run-tests)
