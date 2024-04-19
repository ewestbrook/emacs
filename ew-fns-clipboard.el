;;; ew-fns-clipboard --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-clipboard.el")

(defun ew-toggle-clipboard-mode ()
  "Toggle clipboard mode."
  (interactive)
  (if (eq select-enable-clipboard 't)
      (setq select-enable-clipboard nil)
    (setq select-enable-clipboard 't))
  (message "select-enable-clipboard is now %s" select-enable-clipboard))

(setq-default select-enable-clipboard t)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-clipboard)
;;; ew-fns-clipboard.el ends here
