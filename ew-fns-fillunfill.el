;;; ew-fns-fillunfill --- Summary
;;; Commentary:
;;; see http://endlessparentheses.com/fill-and-unfill-paragraphs-with-a-single-key.html
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-fillunfill.el")

;; (defun ew-fillunfill ()
;;   "Like `fill-paragraph', but unfill if used twice."
;;   (interactive)
;;   (let ((fill-column
;;          (if (eq last-command 'endless/fill-or-unfill)
;;              (progn (setq this-command nil)
;;                     (point-max))
;;            fill-column)))
;;     (call-interactively #'fill-paragraph)))

;; (global-set-key [remap fill-paragraph]
;;                 #'ew-fillunfill)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-fillunfill)
;;; ew-fns-fillunfill.el ends here
