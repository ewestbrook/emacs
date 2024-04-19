;;; ew-flycheck -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-flycheck.el")

(use-package flycheck
  :config
  ;; (setq-default flycheck-python-pylint-executable "python3")
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'sh-mode-hook 'flycheck-mode)
  (add-hook 'cperl-mode-hook 'flycheck-mode))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-flycheck)
;;; ew-flycheck.el ends here
