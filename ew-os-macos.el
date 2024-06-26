;;; ew-os-macos --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-os-macos.el")

(if (equal system-type 'darwin)
    (progn
      (setq-default mac-option-key-is-meta  nil)
      (setq-default mac-command-key-is-meta t)
      (setq-default mac-command-modifier    'meta)
      (setq-default mac-option-modifier     nil)

      ;; https://www.emacswiki.org/emacs/BrowseUrl#toc26
      (setq-default browse-url-browser-function
                    (quote browse-url-generic))
      (setq-default browse-url-generic-program "open")

      (message "ew-os-macos: Mac OS X")))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-os-macos)
;;; ew-os-macos.el ends here
