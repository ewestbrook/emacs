;;; ew-string-fns --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "ew-string-fns")
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
(provide 'ew-string-fns)
;;; ew-string-fns ends here
