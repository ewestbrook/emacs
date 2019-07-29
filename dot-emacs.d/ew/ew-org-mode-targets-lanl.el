;;; ew-org-mode-targets-lanl -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets-lanl")
;; -------------------------------------------------------
(setq-default
 org-publish-project-alist
 '(

   ("mgmt"
    :base-directory "~/git/eew-mgmt"
    :base-extension "org"
    :publishing-directory "~/git/eew-mgmt-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("w"
    :base-directory "~/git/w/src"
    :base-extension "org"
    :publishing-directory "~/git/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))
(provide 'ew-org-mode-targets-lanl)
;;; ew-org-mode-targets-lanl ends here
