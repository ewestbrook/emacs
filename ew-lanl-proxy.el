;;; ew-lanl-proxy --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-lanl-proxy")

(require 's)
(require 'ew-string)

(setq-default ew-lanl-proxy-client-hosts
              '("viking"
                "pn1248518"))

(setq-default ew-lanl-proxy-client-nets
              '("lcs.net"
                "lanl.gov"))

(setq-default
 ew-lanl-proxy-client-pats)

(setq-default ew-lanl-proxy-url
              "http://proxyout.lanl.gov:8080")

(setq-default ew-proxy-local-domains
              '("localhost"
                "lanl.gov"
                "lcs.lanl.gov"
                "lcs.net"))

(setq-default ew-proxy-local-regexps
              '("^10\\.[0-9]+\\.[0-9]+\\.[0-9]+$"
                "^172\\.55\\.[0-9]+\\.[0-9]+$"
                "^192\\.168\\.[0-9]+\\.[0-9]+$"
                "^127\\.[0-9]+\\.[0-9]+\\.[0-9]+"))

(cond
 ((ew-string-matches-one-of
   (system-name)
   (append
  (mapcar (lambda(s)
            (concat "^" (regexp-quote s) "$"))
          (append
           ew-lanl-proxy-client-hosts
           ew-lanl-proxy-client-nets))
  (mapcar (lambda(s)
            (concat "\\." (regexp-quote s) "$"))
          ew-lanl-proxy-client-nets)))
  (progn
    (message "loading ew-lanl-proxy: Setting LANL proxy")
    (setenv "HTTP_PROXY"  ew-lanl-proxy-url)
    (setenv "HTTPS_PROXY" ew-lanl-proxy-url)
    (setenv "FTP_PROXY"   ew-lanl-proxy-url)
    (setenv
     "NO_PROXY"
     (s-join "," '("localhost"
                   "127.0.0.1"
                   "lanl.gov"
                   ".lanl.gov"
                   "lcs.lanl.gov"
                   ".lcs.lanl.gov")))
    (setq-default
     url-proxy-services
     (list
      (cons
       "no_proxy"
       (concat
        "^\\("
        (s-join
         "\\|"
         (append
          (mapcar 'regexp-quote
                  ew-proxy-local-domains)
          (mapcar (lambda(s)
                    (concat ".*\\." (regexp-quote s)))
                  ew-proxy-local-domains)
          ew-proxy-local-regexps))
        "\\)"))
      '("http" . "proxyout.lanl.gov:8080")
      '("https" . "proxyout.lanl.gov:8080"))))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-lanl-proxy)
;;; ew-lanl-proxy.el ends here
