;;; ew-xref -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq xref-search-program 'ripgrep)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-xref)
;;; ew-xref.el ends here
