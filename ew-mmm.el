;;; ew-mmm --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-mmm")

(setq-default mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-mmm)
;;; ew-mmm.el ends here
