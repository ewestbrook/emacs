;;; ew-flyspell -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "loading ew-flyspell")

(setq-default ispell-program-name "/usr/bin/aspell")
(add-hook 'text-mode-hook 'flyspell-mode)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-flyspell)
;;; ew-flyspell.el ends here
