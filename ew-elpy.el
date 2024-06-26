;;; ew-elpy -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-elpy.el")

(use-package elpy

  :ensure t
  :hook (elpy-mode . ew-elpy-init)
  :init (elpy-enable)
  :bind (("C-c C-g" . ew-elpy-goto-def-or-rgrep))

  :preface
  (defun ew-elpy-init()
    "Init elpy."
    (message "ew-elpy init start")
    (if (string-match "\\.lcs.lanl.gov$" (system-name))
        (pyvenv-activate "/usr/lcs/python/rocky311venv")
      (pyvenv-activate "~/.venv"))
    (setq elpy-rpc-virtualenv-path 'current)
    (set-face-attribute 'highlight-indentation-face nil :background "grey20")
    (message "ew-elpy init finish"))

  (defun ew-elpy-goto-def-or-rgrep ()
    "Go to definition of thing at point or do an rgrep in project if that fails"
    (interactive)
    (condition-case nil (elpy-goto-definition-other-window)
      (error (elpy-rgrep-symbol (thing-at-point 'symbol)))))

  :hook (elpy-mode . ew-elpy-init)

  :bind
  (("C-c C-g" . ew-elpy-goto-def-or-rgrep))

  :init
  (elpy-enable))


;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-elpy)
;;; ew-elpy.el ends here
