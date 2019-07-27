;;; ew-org-mode-targets-a1 -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets-a1")
;; -------------------------------------------------------
(setq-default
 org-publish-project-alist
 '(

   ("cv"
    :base-directory "~/git/eew-cv"
    :base-extension "org"
    :publishing-directory "~/git/eew-cv-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))
;; -------------------------------------------------------
(provide 'ew-org-mode-targets-a1)
;;; ew-org-mode-targets-a1 ends here
