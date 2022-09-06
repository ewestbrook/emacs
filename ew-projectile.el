;;; ew-projectile --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-projectile")

(projectile-mode +1)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-projectile)
;;; ew-projectile.el ends here
