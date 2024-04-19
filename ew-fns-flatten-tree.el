;;; ew-fns-flatten-tree -- Summary Commentary: Included
;;; in Emacs 27 but not prior versions, so if not
;;; present, we provide it here.
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-flatten-tree.el")

(if (symbol-function 'flatten-tree)
    (message "flatten-tree already present")
  (progn
    (defun flatten-tree (tree)
      "Return a \"flattened\" copy of TREE.
In other words, return a list of the non-nil terminal nodes, or
leaves, of the tree of cons cells rooted at TREE.  Leaves in the
returned list are in the same order as in TREE.

\(flatten-tree \\='(1 (2 . 3) nil (4 5 (6)) 7))
=> (1 2 3 4 5 6 7)"
      (let (elems)
        (while (consp tree)
          (let ((elem (pop tree)))
            (while (consp elem)
              (push (cdr elem) tree)
              (setq elem (car elem)))
            (if elem (push elem elems))))
        (if tree (push tree elems))
        (nreverse elems)))
    (message "flatten-tree defined")))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-flatten-tree)
;;; ew-fns-flatten-tree.el ends here
