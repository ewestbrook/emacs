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
    (message "ew-python tab-width w")
    (setq tab-width w)
    (message "ew-python python-indent w")
    (setq python-indent w)
    (message "ew-python python-indent-offset w")
    (setq py-indent-offset w))

  (defun ew-python-init()
    "EW Python init."
    (message "ew-python hook start")
    (pyvenv-mode)
    (setq python-indent-guess-indent-offset nil)
    (message "ew-python python-indent-guess-indent-offset nil")
    (setq python-indent-guess-indent-offset-verbose nil)
    (ew-python-set-tab-width 4)
    (setq py-indent-tabs-mode nil)
    (message "ew-python hs-minor-mode 1")
    (hs-minor-mode 1)
    (message "ew-python hs-minor-mode-map")
    (define-key hs-minor-mode-map
                (kbd "C-c TAB") 'hs-toggle-hiding)
    (if (not (display-graphic-p))
        (set-face-attribute 'font-lock-function-name-face nil :foreground "cyan"))
    (message "ew-python hook done"))

  :hook (python-mode . ew-python-init)

  :config (setq py-keep-windows-configuration t))

  ;; :bind (("C-c C-c" . elpy-shell-send-region-or-buffer)
  ;;        ("C-RET"   . elpy-shell-send-statement-and-step)
  ;;        ("C-c C-z" . elpy-shell-switch-to-shell)
  ;;        ("C-c C-d" . elpy-doc)))

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
