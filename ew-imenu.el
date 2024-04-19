;;; ew-imenu -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-imenu.el")

(use-package imenu-anywhere
  :ensure t
  :bind (("C-." . imenu-anywhere))
  ;; :hook ('font-lock-mode 'ew-try-to-add-imenu)
  ;; :preface
  ;; (defun ew-try-to-add-imenu ()
  ;;   "Try to add imenu."
  ;;   (condition-case nil (imenu-add-to-menubar "imenu") (error nil)))
  )

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-imenu)
;;; ew-imenu.el ends here
