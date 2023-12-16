;;; ew-elpy -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package elpy

  :ensure t

  :hook (elpy-mode . ew-elpy-init)

  :preface

  (defun ew-elpy-init()
    "Init elpy."
    (if (not (display-graphic-p))
        (progn
          (set-face-attribute 'highlight-indentation-face nil :background "grey15"))))

  (defun ew-elpy-goto-def-or-rgrep ()
    "Go to definition of thing at point or do an rgrep in project if that fails"
    (interactive)
    (condition-case nil (elpy-goto-definition-other-window)
      (error (elpy-rgrep-symbol (thing-at-point 'symbol)))))

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
