;;; ew-perl --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-perl.el")

(defalias 'perl-mode 'cperl-mode)

(use-package cperl-mode
  :ensure nil
  :config
  (setq cperl-indent-level 2))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-perl)
;;; ew-perl.el ends here
