;;; ew-fns-mode -- Summary
;;; Commentary:
;;; Code:

(message "ew-fns-mode.el")

(defun ew-mode-parents (mode)
  "Collect a list of the ancestors of major mode MODE."
  (and mode
       (cons mode (ew-mode-parents
                   (get mode 'derived-mode-parent)))))

;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-mode)
;;; ew-fns-mode.el ends here
