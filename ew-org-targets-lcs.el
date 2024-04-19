;;; ew-org-targets-lcs -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-org-targets-lcs.el")

(setq-default
 org-publish-project-alist
 '(

       ("ew"
        :base-directory "~/org/ew"
        :base-extension "org"
        :publishing-directory "~/org/h/ew"
        :recursive t
        :publishing-function org-twbs-publish-to-html
        :auto-preamble nil)

       ("aotic"
        :base-directory "~/org/aotic"
        :base-extension "org"
        :publishing-directory "~/org/h/aotic"
        :recursive t
        :publishing-function org-twbs-publish-to-html
        :auto-preamble nil)

       ("lanl"
        :base-directory "~/org/lanl"
        :base-extension "org"
        :publishing-directory "~/org/h/lanl"
        :recursive t
        :publishing-function org-twbs-publish-to-html
        :auto-preamble nil)

       ("lcs"
        :base-directory "~/org/lcs"
        :base-extension "org"
        :publishing-directory "~/org/h/lcs"
        :recursive t
        :publishing-function org-twbs-publish-to-html
        :auto-preamble nil)

       ("tech"
        :base-directory "~/org/tech"
        :base-extension "org"
        :publishing-directory "~/org/h/tech"
        :recursive t
        :publishing-function org-twbs-publish-to-html
        :auto-preamble nil)

       ))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-targets-lcs)
;;; ew-org-targets-lcs.el ends here
