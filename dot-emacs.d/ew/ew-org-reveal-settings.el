;;; ew-org-reveal-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-reveal-settings")
;; -------------------------------------------------------
;; see also
;; https://github.com/yjwen/org-reveal/
;; -------------------------------------------------------
(setq-default org-reveal-root "./reveal.js")
(setq-default org-reveal-title-slide 'auto)
;; -------------------------------------------------------
(defun ew-org-reveal-to-browser ()
  "Call org-reveal-export-to-html-and-browse."
  (interactive)
  (save-buffer)
  (org-reveal-export-to-html-and-browse))
;; -------------------------------------------------------
(provide 'ew-org-reveal-settings)
;;; ew-org-reveal-settings ends here
