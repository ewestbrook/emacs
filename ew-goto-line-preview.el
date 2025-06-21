;;; ew-goto-line-preview.el -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-goto-line-preview.el")

(use-package goto-line-preview

  :ensure t

  :init
  (setq goto-line-preview-hl-duration 2.5)
  ;; (set-face-background 'goto-line-preview-hl "white")

  :bind
  ("M-g M-g" . goto-line-preview)

  )

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-goto-line-preview)
;;; ew-goto-line-preview.el ends here
