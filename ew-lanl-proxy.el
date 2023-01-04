;;; ew-lanl-proxy --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(if (string-match "\\.lanl\\.gov$" (system-name))
    (setq url-proxy-services
          '(("no_proxy" . "^\\(localhost\\|10.*\\|192.168.29.*\\|172.55.*\\|lcs.lanl.gov\\|lanl.gov\\)")
            ("http" . "proxyout.lanl.gov:8080")
            ("https" . "proxyout.lanl.gov:8080"))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-lanl-proxy)
;;; ew-lanl-proxy.el ends here
