;;; ew-gnus -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-gnus.el")

(setq-default
 gnus-select-method
 '(nnimap "mail.westbrook.io"
          (nnimap-server-port 9993)
          (nnimap-stream ssl)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-gnus)
;;; ew-gnus.el ends here
