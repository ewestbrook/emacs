;;; ew-window --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-window")

(defun no-split-window ()
  "Function for preference of not splitting window."
  (interactive) nil)

(setq-default split-window-preferred-function 'no-split-window)

(set-fill-column 57)
(setq-default fill-column 57)

(setq-default truncate-partial-width-windows 80)

(add-to-list 'same-window-regexps "\*eshell\*")
(add-to-list 'same-window-regexps "\*shell\*")

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-window)
;;; ew-window.el ends here
