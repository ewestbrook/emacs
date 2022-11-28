;;; ew-imenu -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "loading ew-imenu")

(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "imenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

(global-set-key (kbd "C-.") 'imenu-anywhere)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-imenu)
;;; ew-imenu.el ends here
