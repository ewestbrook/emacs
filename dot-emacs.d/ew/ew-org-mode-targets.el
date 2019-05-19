;;; ew-org-mode-targets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(let (sysnam)
  (setq sysnam (system-name))
  (cond

   ((string= sysnam "e1")
    (require 'ew-org-mode-targets-e1))

   ((string= sysnam "viking")
    (require 'ew-org-mode-targets-viking))

   ))
;; -------------------------------------------------------
(provide 'ew-org-mode-targets)
;;; ew-org-mode-targets ends here
