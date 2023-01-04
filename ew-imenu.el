;;; ew-imenu -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(defun ew-try-to-add-imenu ()
  "Try to add imenu."
  (condition-case nil (imenu-add-to-menubar "imenu") (error nil)))
(add-hook 'font-lock-mode-hook 'ew-try-to-add-imenu)

(global-set-key (kbd "C-.") 'imenu-anywhere)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-imenu)
;;; ew-imenu.el ends here
