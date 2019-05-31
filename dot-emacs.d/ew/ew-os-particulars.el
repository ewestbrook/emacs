;;; ew-os-particulars --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; see https://apple.stackexchange.com/questions/12087/emacs-on-mac-os-x-to-alt-or-command
(cond

 ((equal system-type 'windows-nt) ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))

 ((equal system-type 'darwin) ; Mac OS X
  (progn
    (setq-default mac-option-key-is-meta nil)
    (setq-default mac-command-key-is-meta t)
    (setq-default mac-command-modifier 'meta)
    (setq-default mac-option-modifier nil)
    ;; https://www.emacswiki.org/emacs/BrowseUrl#toc26
    (setq-default browse-url-browser-function
                  (quote browse-url-generic))
    (setq-default browse-url-generic-program "open")
    (message "Mac OS X")))

 ((equal system-type 'gnu/linux) ; linux
  (progn
    (message "Linux"))))
;; -------------------------------------------------------
(provide 'ew-os-particulars)
;;; ew-os-particulars ends here
