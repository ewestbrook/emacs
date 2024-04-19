;;; ew-ini -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-ini.el")

(use-package ini
  :ensure t
  :mode (("\\.ini" . ini-mode)
         ("\\.service" . ini-mode)
         ("\\.timer" . ini-mode)))


;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-ini)
;;; ew-ini.el ends here
