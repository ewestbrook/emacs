;;; ew-tramp --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(setq-default tramp-default-method "ssh")
(setq-default tramp-change-syntax 'simplified)

;; (push "/usr/local/bin" tramp-remote-path)
;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;; (setq-default tramp-persistency-file-name nil)
;; (add-to-list 'tramp-remote-path "/usr/lcs/local/bin")

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-tramp)
;;; ew-tramp.el ends here
