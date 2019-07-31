;;; ew-org-reveal-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; see also
;; https://github.com/yjwen/org-reveal/
;; -------------------------------------------------------
;; (setq org-reveal-root "./reveal.js")
;; -------------------------------------------------------
(defun ew-org-reveal-to-browser ()
  "Call org-reveal-export-to-html-and-browse."
  (interactive)
  (save-buffer)
  (org-reveal-export-to-html-and-browse))
;; -------------------------------------------------------
(provide 'ew-org-reveal-settings)
;;; ew-org-reveal-settings ends here
