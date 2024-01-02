;;; ew-lanl-proxy --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

;; bug, see
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=11788

(if (string-match "\\.lcs.lanl.gov$" (system-name))
    (setq url-proxy-services
          '(("no_proxy" . "^\\(localhost\\|10\\.*\\|192\\.168\\.29\\..*\\|172\\.55\\..*\\|.*\\.lcs\\.lanl\\.gov\\|.*\\.lanl\\.gov\\)")
            ("http" . "proxyout.lcs.lanl.gov:8080")
            ("https" . "proxyout.lcs.lanl.gov:8080")))
  (if (string-match "\\.lanl\\.gov$" (system-name))
      (setq url-proxy-services
            '(("no_proxy" . "^\\(localhost\\|10\\.*\\|192\\.168\\.29\\..*\\|172\\.55\\..*\\|.*\\.lcs\\.lanl\\.gov\\|.*\\.lanl\\.gov\\)")
              ("http" . "proxyout.lanl.gov:8080")
              ("https" . "proxyout.lanl.gov:8080")))))

  ;; -------------------------------------------------------
  ;; Local Variables:
  ;; mode: emacs-lisp
  ;; End:
  (provide 'ew-lanl-proxy)
;;; ew-lanl-proxy.el ends here
