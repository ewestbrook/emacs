;;; ew-org-targets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-targets")

(require
 (cdr
  (assoc
   (system-name)
   '(("^e1\\b"                 . ew-org-targets-ew)
     ("^p13b\\b"               . ew-org-targets-ew)
     ("^ce2496b\\b"            . ew-org-targets-ew)
     ("^a1\\.local\\b"         . ew-org-targets-ew)
     ("^a1\\.westbrook\\.com$" . ew-org-targets-ew)
     ("^viking\\b"             . ew-org-targets-ew)
     ("\\.lcs\\.net$"          . ew-org-targets-lcs)
     ("\\.lanl\\.gov$"         . ew-org-targets-lanl))
   'string-match)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("eot-" . "ew-org-targets-"))
;; End:
(provide 'ew-org-targets)
;;; ew-org-targets.el ends here
