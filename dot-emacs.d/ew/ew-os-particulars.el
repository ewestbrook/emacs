;;; ew-os-particulars --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; see https://apple.stackexchange.com/questions/12087/emacs-on-mac-os-x-to-alt-or-command
;; -------------------------------------------------------
(message "loading ew-os-particulars")
;; -------------------------------------------------------
(cond

 ((equal system-type 'windows-nt) ; Microsoft Windows
  (progn
    (message "ew-os-particulars: Microsoft Windows")))

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
    (message "ew-os-particulars: Mac OS X")))

 ((equal system-type 'gnu/linux) ; linux
  (progn
    (setq-default browse-url-browser-function 'browse-url-firefox)
    (setq-default browse-url-new-window-flag  t)
    (setq-default browse-url-firefox-new-window-is-tab t)
    ;; (global-set-key (kbd "s-b") 'backward-word)
    ;; (global-set-key (kbd "s-f") 'forward-word)
    ;; (global-set-key (kbd "s-w") 'kill-ring-save)
    ;; (global-set-key (kbd "s-d") 'kill-word)
    ;; (global-set-key (kbd "s-t") 'transpose-words)
    (message "ew-os-particulars: Linux"))))
;; -------------------------------------------------------
(provide 'ew-os-particulars)
;;; ew-os-particulars ends here
