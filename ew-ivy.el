;;; ew-ivy.el -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-ivy.el")

(use-package ivy

  :bind (("C-x b"   . ivy-switch-buffer)
         ("C-c v"   . ivy-push-view)
         ("C-c V"   . ivy-pop-view)
         ("C-c C-r" . ivy-resume))
  :config
  (setq enable-recursive-minibuffers nil)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ") ;; intentional space before end of string
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
        '(
          (t . ivy--regex-fuzzy)
          (t . ivy--regex-ignore-order)
          )))

(ivy-mode 1)
(counsel-mode 1)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-ivy)
;;; ew-ivy.el ends here
