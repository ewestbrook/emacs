;;; ew-python --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-python.el")

(use-package python-mode

  :ensure t
  :defer t
  :requires pyvenv

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
    (pyvenv-mode)
    (setq python-indent-guess-indent-offset nil)
    (setq python-indent-guess-indent-offset-verbose nil)
    (ew-python-set-tab-width 4)
    (setq py-indent-tabs-mode nil)
    (hs-minor-mode 1)
    (define-key hs-minor-mode-map (kbd "C-c TAB") 'hs-toggle-hiding))

  :hook (python-mode . ew-python-init)

  :config
  (setq py-keep-windows-configuration t))

(use-package elpy

  :ensure t
  :defer t

  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-python)
;;; ew-python.el ends here
