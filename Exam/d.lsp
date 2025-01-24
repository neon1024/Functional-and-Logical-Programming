
(defun f (l e e1)
  (cond
    ((null l) nil)
    ((and (atom l) (eq l e))
      e1
    )
    ((atom l)
      l
    )
    (t
      (mapcar (lambda (x) (f x e e1)) l)
    )
  )
)
