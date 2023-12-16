;;; ew-python --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package python

  :mode ("\\.py" . python-mode)

  :preface
  (defun ew-python-set-tab-width(w)
    "EW Python set tab width to w"
    (interactive "NTab width: ")
    (setq tab-width w)
    (setq python-indent w)
    (setq py-indent-offset w))

  (defun ew-python-init()
    "EW Python init."
    (setq python-indent-guess-indent-offset nil)
    (setq python-indent-guess-indent-offset-verbose nil)
    (ew-python-set-tab-width 2)
    (setq py-indent-tabs-mode nil)
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (hs-minor-mode 1)
    (define-key hs-minor-mode-map (kbd "C-c TAB") 'hs-toggle-hiding))

  :hook (python-mode . ew-python-init)

  :config
  (setq py-keep-windows-configuration t))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-python)
;;; ew-python.el ends here
