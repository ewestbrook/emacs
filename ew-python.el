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
    (setq-default python-indent-guess-indent-offset nil)
    (setq-default python-indent-guess-indent-offset-verbose nil)
    (setq-default tab-width 2)
    (setq-default python-indent 2)
    (setq-default py-indent-offset 2)
    (setq-default py-indent-tabs-mode nil)
	  (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-python)
;;; ew-python.el ends here
