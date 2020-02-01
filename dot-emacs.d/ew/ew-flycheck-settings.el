;;; ew-flycheck-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-flycheck-settings")
;; -------------------------------------------------------
;; flycheck
;; Note: flycheck REPLACES flymake
;; (setq-default flycheck-python-pylint-executable "python3")
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'sh-mode-hook 'flycheck-mode)
;; -------------------------------------------------------
(provide 'ew-flycheck-settings)
;;; ew-flycheck-settings ends here
