(defun triple (x)
	(* x 3)
)

; (1 2 a (3 (0 b))) => (3 6 a (9 (0 b)))
(defun non-linear-triple (x)
	(cond
		((atom x)
			(triple x)
		)
		(t
			(mapcar #'non-linear-triple x)
		)
	)
)