;;; ew-gnus -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; gnus

(setq-default
 gnus-select-method
 '(nnimap "mail.westbrook.io"
          (nnimap-server-port 9993)
          (nnimap-stream ssl)))

(setq-default
 gnus-secondary-select-methods
 '((nnimap "mail.vmedex.net"
           (nnimap-server-port 993)
           (nnimap-stream ssl))))
;; -------------------------------------------------------
(provide 'ew-gnus)
;;; ew-gnus ends here
