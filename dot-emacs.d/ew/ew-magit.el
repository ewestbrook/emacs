;;; ew-magit -- Summery -*- mode: emacs-lisp; -*-
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(setq-default
 magit-status-buffer-switch-function
 'switch-to-buffer)
;; -------------------------------------------------------
;; (add-to-list 'magit-section-initial-visibility-alist '(@{upstream} . show))
;; -------------------------------------------------------
(provide 'ew-magit)
;;; ew-magit.el ends here
