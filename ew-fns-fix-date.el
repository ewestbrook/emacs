;;; ew-fns-fix-date --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-fix-date.el")

(defun ew-fix-us-date()
  "Fix next US-format date to %F."
  (interactive)
  (re-search-forward "\\b\\([0-9]\\{1,2\\}\\)[/-]\\([0-9]\\{1,2\\}\\)[-/]\\([0-9]\\{4\\}\\)\\b")
  (replace-match
   (format "%04d-%02d-%02d"
           (string-to-number (match-string 3))
           (string-to-number (match-string 1))
           (string-to-number (match-string 2))))
  t)

(defun ew-fix-us-dates()
  "Fix all US-format dates in buffer to %F."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (ew-fix-us-date))))

(defun ew-make-org-date()
  "Make the next %F formatted date an org date."
  (interactive)
  (re-search-forward "\\([^[]\\)\\b\\([0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\)\\b")
  (replace-match (concat (match-string 1) "[" (match-string 2) "]" ))
  (backward-char 1)
  (org-ctrl-c-ctrl-c)
  t)

(defun ew-make-org-dates()
  "Make all %F formatted dates into org dates."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (ew-make-org-date))))

(defun ew-fix-org-dates()
  "Make US-format dates into %F dates and org-ify."
  (interactive)
  (ew-fix-us-dates)
  (ew-make-org-dates))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-fix-date)
;;; ew-fns-fix-date.el ends here
