; Să se substituie un element ​ e prin altul ​e1 la orice nivel impar al unei liste neliniare. Nivelul superficial se consideră 1. De
; exemplu, pentru lista (1 d (2 d (d))), ​e​=d şi ​e1​=f rezultă lista (1 f (2 d (f))).

(defun substituie(l e e1 niv)
(cond
(
(AND (atom l) (not (equal l e)))
l
)
(
(AND (atom l) (equal l e) (equal (mod niv 2) 0))
e
)
(
(AND (atom l) (equal l e) (equal (mod niv 2) 1))
e1
)
(
T
(mapcar #'(lambda (x)
(substituie x e e1 (+ niv 1))
)
l
)
)
)
)