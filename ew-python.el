;;; ew-python --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-python")

(setq-default py-keep-windows-configuration t)

(add-to-list 'auto-mode-alist '("\\.py" . python-mode))

(add-hook
 'python-mode-hook
 '(lambda ()
    (setq python-indent-guess-indent-offset t)
    (setq python-indent-guess-indent-offset-verbose nil)
    (setq python-indent 2)
    (setq py-indent-offset 2)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-python)
;;; ew-python.el ends here
