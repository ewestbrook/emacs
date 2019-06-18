;;; ew-org-mode-targets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets")
;; -------------------------------------------------------
(let (sysnam)
  (setq sysnam (system-name))
  (cond

   ((string= sysnam "e1")
    (require 'ew-org-mode-targets-e1))

   ((string-match "\\.lcs\\.net$" sysnam)
    (require 'ew-org-mode-targets-lcs))

   ((string-match "\\.lanl\\.gov$" sysnam)
    (require 'ew-org-mode-targets-lanl))

   ))
;; -------------------------------------------------------
(provide 'ew-org-mode-targets)
;;; ew-org-mode-targets ends here
