;;; ew-fns-fixnextdate --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(defun ew-fix-us-date()
  "Fix next US-format date to %F."
  (interactive)
  (re-search-forward "\\b\\([0-9]\\{1,2\\}\\)[/-]\\([0-9]\\{1,2\\}\\)[-/]\\([0-9]\\{4\\}\\)\\b")
  (replace-match
   (format "%04d-%02d-%02d"
           (string-to-number (match-string 3))
           (string-to-number (match-string 1))
           (string-to-number (match-string 2))
           )
   )
  t
  )

(defun ew-fix-us-dates()
  "Fix all US-format dates in buffer to %F."
  (interactive)
  (goto-char (point-min))
  (while
      (ew-fix-us-date)
    )
  )

(defun ew-make-org-date()
  "Make the next %F formatted date an org date."
  (interactive)
  (re-search-forward "[^[]\\b\\([0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\)\\b")
  (replace-match
   (concat
    "["
    (match-string 1)
    "]"
    )
   )
  (backward-char 1)
  (org-ctrl-c-ctrl-c)
  t
  )

(defun ew-make-org-dates()
  "Make all US-format dates into org dates."
  (interactive)
  (goto-char (point-min))
  (while
      (ew-make-org-date)
    )
  )

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-fixnextdate)
;;; ew-fns-fixnextdate.el ends here
