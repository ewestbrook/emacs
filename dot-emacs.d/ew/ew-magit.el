;;; ew-magit -- Summery -*- mode: emacs-lisp; -*-
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-magit")
;; -------------------------------------------------------
(setq-default
 magit-status-buffer-switch-function
 'switch-to-buffer)
(setq-default magit-diff-refine-hunk 'all)
(setq-default magit-diff-paint-whitespace t)
(setq-default magit-diff-highlight-trailing t)
(setq-default magit-diff-hide-trailing-cr-characters t)
;; -------------------------------------------------------
;; (add-to-list 'magit-section-initial-visibility-alist '(@{upstream} . show))
;; -------------------------------------------------------
(provide 'ew-magit)
;;; ew-magit.el ends here
