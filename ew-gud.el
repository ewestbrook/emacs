;;; ew-gud -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-gud.el")

(global-set-key (kbd"<f5>") 'gud-cont)
(global-set-key (kbd"<f7>") 'gud-finish)
(global-set-key (kbd"<f8>") 'gud-next)
(global-set-key (kbd"<f9>") 'gud-watch)
(global-set-key (kbd"<f10>") 'gud-step)
;; (global-set-key (kbd"<f6>") 'gud-break)
;; (global-set-key [f7] 'my-compile)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-gud)
;;; ew-gud.el ends here
