;;; ew-tramp-settings --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-tramp-settings")
;; -------------------------------------------------------
(setq-default tramp-default-method "ssh")
;; (push "/usr/local/bin" tramp-remote-path)
;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;; (setq-default tramp-persistency-file-name nil)
;; (add-to-list 'tramp-remote-path "/usr/lcs/local/bin")
;; -------------------------------------------------------
(provide 'ew-tramp-settings)
;;; ew-tramp-settings ends here
