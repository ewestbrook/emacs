;;; ew-proxy-lanl --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(let (sysnam)
  (setq sysnam (system-name))
  (message (concat "System name: " sysnam))
  (cond
   ((or (string= sysnam "viking")
        (string= sysnam "pn1248518")
        (string-match "\\.lcs\\.net$" sysnam)
        (string-match "\\.lanl\\.gov$" sysnam))
    (progn
      (message "Setting LANL proxy")
      (setenv "HTTP_PROXY"  "http://proxyout.lanl.gov:8080")
      (setenv "HTTPS_PROXY" "http://proxyout.lanl.gov:8080")
      (setenv "FTP_PROXY"   "http://proxyout.lanl.gov:8080")
      (setenv
       "NO_PROXY"
       (concat "localhost"      ","
               "127.0.0.1"      ","
               "lanl.gov"       ","
               ".lanl.gov"      ","
               "lcs.lanl.gov"   ","
               ".lcs.lanl.gov"
               ))
        (setq-default
         url-proxy-services
         '(
           ("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\|lanl\\.gov\\|lcs\\.lanl\\.gov\\|.*\\.lcs\\.lanl\\.gov\\)")
           ("http" . "proxyout.lanl.gov:8080")
           ("https" . "proxyout.lanl.gov:8080")))))))
;; -------------------------------------------------------
(provide 'ew-proxy-lanl)
;;; ew-proxy-lanl ends here
