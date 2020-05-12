;;; ew-mmm-mode-settings --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-mmm-mode-settings")
;; -------------------------------------------------------
(setq-default mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
;; -------------------------------------------------------
(provide 'ew-mmm-mode-settings)
;;; ew-mmm-mode-settings ends here