;;; ew-sh --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-sh")

(add-hook
 'sh-mode-hook
 (lambda ()
   (setq sh-basic-offset 2
         sh-indentation 2)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewsh-" . "ew-sh-"))
;; End:
(provide 'ew-sh)
;;; ew-sh.el ends here
