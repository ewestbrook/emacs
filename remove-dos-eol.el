;;; remove-dos-eol -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

;; see also
;; https://stackoverflow.com/a/750933
(defun remove-dos-eol()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'remove-dos-eol)
;;; remove-dos-eol.el ends here
