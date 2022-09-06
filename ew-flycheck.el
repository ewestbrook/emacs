;;; ew-flycheck -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-flycheck")

;; flycheck
;; Note: flycheck REPLACES flymake
;; (setq-default flycheck-python-pylint-executable "python3")
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'sh-mode-hook 'flycheck-mode)
(add-hook 'cperl-mode-hook 'flycheck-mode)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewf-" . "ew-flycheck-"))
;; End:
(provide 'ew-flycheck)
;;; ew-flycheck.el ends here
