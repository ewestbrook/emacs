;;; ew-org-targets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-org-targets.el")

(require
 (cdr
  (assoc
   (system-name)
   '(("^e1\\b"                 . ew-org-targets-ew)
     ("^p13b\\b"               . ew-org-targets-ew)
     ("^ce2496b\\b"            . ew-org-targets-ew)
     ("^a1\\.local\\b"         . ew-org-targets-ew)
     ("^a1\\.westbrook\\.com$" . ew-org-targets-ew)
     ("\\.lcs\\.net$"          . ew-org-targets-ew)
     ("\\.lcs\\.lanl\\.gov$"   . ew-org-targets-ew)
     ("\\.lanl\\.gov$"         . ew-org-targets-lanl))
   'string-match)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-targets)
;;; ew-org-targets.el ends here
