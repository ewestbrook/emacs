;;; ew-string --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(defun ew-string-matches-one-of(str pats)
  "Return first match of STR against any regular expression in PATS."
  (catch 'result
    (mapc (lambda(pat)
            (let ((lhs (string-match pat str)))
              (cond (lhs (throw 'result lhs)))))
          pats)
    (throw 'result nil)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-string)
;;; ew-string.el ends here
