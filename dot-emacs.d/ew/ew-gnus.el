;; -------------------------------------------------------
;; gnus

(setq gnus-select-method
      '(nnimap "mail.westbrook.io"
               (nnimap-server-port 9993)
               (nnimap-stream ssl)))

(setq gnus-secondary-select-methods
      '((nnimap "mail.vmedex.net"
               (nnimap-server-port 993)
               (nnimap-stream ssl))))

;; -------------------------------------------------------
