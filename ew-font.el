;;; ew-font --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-font.el")

(if (display-graphic-p)
    (progn
      (setq
       default-frame-alist
       '((cursor-color     . "Yellow")
         (mouse-color      . "Yellow")
         (foreground-color . "#a6a376")
         (background-color . "#181818")))
      (add-to-list
       'default-frame-alist
       (cons 'font
             (let*
                 ((map '(("^p13[ab]\\b"          . "JetBrains Mono 13")
                         ("^a1\\b"               . "JetBrains Mono 14")
                         ("^pn2001140\\b"        . "JetBrains Mono 14")
                         ("^viking\\b"           . "JetBrains Mono 11")
                         ("^e1\\b"               . "JetBrains Mono 8")
                         ("\\.westbrook\\.com$"  . "JetBrains Mono 8")
                         ("\\.lcs\\.lanl\\.gov$" . "JetBrains Mono 11")
                         ("\\.lanl\\.gov$"       . "JetBrains Mono 14")))
                  (a (cdr (assoc (system-name) map 'string-match))))
               (or a
                   (cdr
                    (assoc (car (split-string (shell-command-to-string "hostname -f")))
                           map 'string-match)))))))
  (progn
    (set-face-attribute 'match nil :background "RoyalBlue3")
    (set-face-attribute 'region nil :background "RoyalBlue3")))

(set-face-attribute 'default nil :foreground "#a6a376")

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-font)
;;; ew-font.el ends here
