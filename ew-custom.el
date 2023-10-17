;;; ew-custom -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(let
    ((h (car (split-string (system-name) "\\."))))
  (setq custom-file (concat "~/.emacs-custom-" h ".el"))
  (setq user-emacs-directory (concat "~/.emacs." h ".d")))

(load custom-file)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-custom)
;;; ew-custom.el ends here
