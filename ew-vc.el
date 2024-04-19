;;; ew-vc --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-vc.el")

(setq-default vc-handled-backends nil)
(add-to-list 'vc-handled-backends 'CVS)
(add-to-list 'vc-handled-backends 'RCS)
(add-to-list 'vc-handled-backends 'SVN)
(add-to-list 'vc-handled-backends 'GIT)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-vc)
;;; ew-vc.el ends here
