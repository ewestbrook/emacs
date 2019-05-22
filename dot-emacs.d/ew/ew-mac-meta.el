;;; ew-mac-meta --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; see https://apple.stackexchange.com/questions/12087/emacs-on-mac-os-x-to-alt-or-command
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)
    (message "Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux"))))
;; -------------------------------------------------------
(provide 'ew-mac-meta)
;;; ew-mac-meta ends here
