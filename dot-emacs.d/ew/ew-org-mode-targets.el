;;; ew-org-mode-targets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets")
(setq-default eomstbhmsg "Host \"%s\" gets org-mode targets module \"%s\"")
;; -------------------------------------------------------
(setq-default
 ew-org-mode-target-module-map
 (list
  (cons "^e1$"                   'ew-org-mode-targets-ew)
  (cons "^ce2496b$"              'ew-org-mode-targets-ew)
  (cons "^a1\\.local$"           'ew-org-mode-targets-ew)
  (cons "^a1\\.westbrook\\.com$" 'ew-org-mode-targets-ew)
  (cons "\\.lcs\\.net$"          'ew-org-mode-targets-lcs)
  (cons "\\.lanl\\.gov$"         'ew-org-mode-targets-lanl)
  )
 )
;; -------------------------------------------------------
(defun ew-org-mode-set-targets-by-host()
  "Get target module by host string."
  (catch 'found
    (let (sysnam)
      (setq sysnam (system-name))
      (loop for (k . v) in ew-org-mode-target-module-map do
            (cond
             ((string-match k sysnam)
              (progn
                (message eomstbhmsg sysnam v)
                (require v)
                (throw 'found v))))))))
;; -------------------------------------------------------
(ew-org-mode-set-targets-by-host)
;; -------------------------------------------------------
(provide 'ew-org-mode-targets)
;;; ew-org-mode-targets ends here
