; 2. Return the list of nodes on the k-th level of a tree of type (1).

;   A
;  / \
; B  C
;    / \
;   D  E

; (1): (A 2 B 0 C 2 D 0 E 0)

; subtree((l1, ..., ln), index) =
; { nth((l1, ..., ln), index + 2)

(defun subtree (tree index)
	; the subtrees start from the third element of the list,
	; so we add 2 to the index to access the correct subtree.
	(nth (+ 2 index) tree)
)

; nodes-on-level((node number-of-subtrees subtree1 subtree2 ... subtreeN), k) =
; { (), if n == 0                                    								; Case 1: Empty tree
; { (node), if k == 0                                  								; Case 2: Return current node at level 0
; { nodes-on-level(subtree1, k-1) U ... U nodes-on-level(subtreeN, k-1), otherwise  ; Case 3: Process all subtrees recursively

(defun nodes-on-level (tree k)
	(cond
		; if n = 0, we return nothing
		((null tree)
			nil
		)
		
		; if k is 0, we are at the desired level, return the node
		((= k 0)
			(list (car tree))
		)
		
		; otherwise, recursively process the subtrees
		(t
			(apply #'append 
				(mapcar
					(lambda (subtree) 
						(nodes-on-level subtree (1- k))
					)
					;; Skip the node and no-of-subtrees (first two elements)
					(cddr tree)
				)
			)
		)
	)
)

(format t "~%The nodes of the list ~a on level ~A are:" `(A 2 (B 0) (C 2 (D 0) (E 0))) 0)
(print (nodes-on-level '(A 2 (B 0) (C 2 (D 0) (E 0))) 0))
