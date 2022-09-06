;;; ew-org-reveal -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-reveal")

;; see also
;; https://github.com/yjwen/org-reveal/

(setq-default org-reveal-root "https://org.westbrook.io/revealjs")
;; (setq-default org-reveal-root "./reveal.js")

(setq-default org-reveal-title-slide nil)
;; (setq-default org-reveal-title-slide 'auto)

(defun ewor-to-browser ()
  "Call org-reveal-export-to-html-and-browse."
  (interactive)
  (save-buffer)
  (org-reveal-export-to-html-and-browse))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewor-" . "ew-org-reveal-"))
;; End:
(provide 'ew-org-reveal)
;;; ew-org-reveal.el ends here
