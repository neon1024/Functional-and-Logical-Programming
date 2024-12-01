(format t "~%L1~%")
; 2.
; a) Write a function to return the product of two vectors.
; dot-product(a-list b-list)
; dot-product((a1, ..., an) (b1, ..., bm)) =
; {
;	0, if n = 0 or m = 0
;	a1*b1 + dot-product((a2, ..., an) (b2, ..., bm)), otherwise
; }
(defun dot-product (a b)
	(if (or (null a) (null b))
		0  ; base case: 0 if len(a) == 0 or len(b) == 0
		(+
			(* (car a) (car b))
			(dot-product (cdr a) (cdr b))
		)
	)
)


(defun print-dot-product (a b)
    (format t "The dot product of ~a and ~a is: ~A~%" a b (dot-product a b))
)


(print-dot-product `(1 2 3) `(1 2 3))


; b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.
(defun depth-of-list (theList)
	(if (atom theList)
		0  ; base case: 0 if len(theList) == 0
		; else
		(
			let  ; results of the depth of the head and tail
				(
					(head-depth (depth-of-list (car theList)))
					(tail-depth (depth-of-list (cdr theList)))
				)
			(max head-depth tail-depth)
		)
	)
)


(defun print-depth-of-list (a)
    (format t "The depth of the list ~a is: ~A~%" a (depth-of-list a))
)


(print-depth-of-list `(1 (2 3) 4 5 (6 7) (8 (9))))


; c) Write a function to sort a linear list without keeping the double values.
(defun insert-sorted (element lst)
	(cond
		((null lst)  ; base case: return the element if len(lst) == 0
			(list element)
		)
        ((< element (car lst))  ; case: return [element, l1] if element < l1
			(cons element lst)
		)
        (t  ; default case: return [element, sorted], otherwise, where sorted is the sorted tail 
			(cons (car lst) (insert-sorted element (cdr lst)))
		)
	)
)


(defun element-in-list (element lst)
	(cond
		((null lst)  ; base case: len(lst) == 0
			nil
		)
        ((= element (car lst))  ; case: return true if l1 == element
			t
		)
        (t  ; default case: continue searching the rest of the list
			(element-in-list element (cdr lst))
		)
	)
)


(defun sort-unique-list (lst)
	(cond
		((null lst)  ; base case: len(lst) == 0
			nil
		)
		((element-in-list (car lst) (cdr lst))  ; case: when an element appears multiple times in the list, ignore it and continue sorting the rest of the list
			(sort-unique-list (cdr lst))
		)
        (t  ; default case: insert the element in the sorted list
			(insert-sorted (car lst) (sort-unique-list (cdr lst)))
		)
	)
)


(defun print-sorted-unique-list (lst)
  (format t "The sorted list without duplicates from ~a is ~a~%" lst (sort-unique-list lst))
)


(print-sorted-unique-list `(1 2 2 3 4 5 5))


; d) Write a function to return the intersection of two sets
; for len(a) >= len(b)
(defun set-intersection (a b)
	(cond
		((null a)
			nil
		)
        ((element-in-list (car a) b)  ; case: a1 in b, return [a1, result], where result is the intersection of the tail of a and b
			(cons (car a) (set-intersection (cdr a) b))
		)
        (t  ; default case: skip a1, a1 not in b
			(set-intersection (cdr a) b)
		)
	)
)


(defun print-set-intersection (set1 set2)
  (format t "The intersection of ~a and ~a is ~a~%" set1 set2 (set-intersection set1 set2)))


(print-set-intersection `(1 2 3 4 5) `(1 2 3))
