;;; ew-org-targets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

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
     ("^lcssvr"                . ew-org-targets-lcs)
     ("\\.lcs\\.net$"          . ew-org-targets-lcs)
     ("\\.lanl\\.gov$"         . ew-org-targets-lanl))
   'string-match)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-targets)
;;; ew-org-targets.el ends here
