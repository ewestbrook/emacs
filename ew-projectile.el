;;; ew-projectile --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-projectile.el")

(use-package projectile

  :ensure t
  ;; :pin melpa-stable

  :init
  (projectile-mode +1)

  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))

  )

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-projectile)
;;; ew-projectile.el ends here
