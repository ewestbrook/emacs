;;; ew-c --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package cc-mode
  :config
  (setq c-offsets-alist '((case-label . +) (statement-case-intro . +)))
  (setq c-basic-offset 2))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-c)
;;; ew-c.el ends here
