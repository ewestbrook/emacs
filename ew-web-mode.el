;;; ew-web-mode --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package web-mode

  :preface
  (defun ew-web-mode-init()
    "EW Web Mode Init."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-indent-style 2))

  :hook ew-web-mode-init

  :mode (("\\.phtml\\'"     . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.jsp\\'"       . web-mode)
         ("\\.as[cp]x\\'"   . web-mode)
         ("\\.erb\\'"       . web-mode)
         ("\\.mustache\\'"  . web-mode)
         ("\\.djhtml\\'"    . web-mode)
         ("\\.php\\'"       . web-mode)
         ("\\.html\\'"      . web-mode)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-web-mode)
;;; ew-web-mode.el ends here
