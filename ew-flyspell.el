;;; ew-flyspell -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-flyspell.el")

(use-package flyspell
  :hook (text-mode-hook . flyspell-mode)
  :config
  (setq ispell-program-name "/usr/bin/aspell"))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-flyspell)
;;; ew-flyspell.el ends here
