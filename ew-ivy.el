;;; ew-ivy.el -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-ivy.el")

;; ivy-mode
(ivy-mode 1)
(counsel-mode 1)
(setq-default enable-recursive-minibuffers nil)
(setq-default ivy-use-virtual-buffers t)
(setq-default ivy-count-format "(%d/%d) ") ;; intentional space before end of string
(setq-default ivy-initial-inputs-alist nil)
(setq-default ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-ivy)
;;; ew-ivy.el ends here
