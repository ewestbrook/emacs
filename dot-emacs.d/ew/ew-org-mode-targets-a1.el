;;; ew-org-mode-targets-a1 -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets-a1")
;; -------------------------------------------------------
(setq-default
 org-publish-project-alist
 '(

   ("budget"
    :base-directory "~/git/eew-budget"
    :base-extension "org"
    :publishing-directory "~/git/eew-budget-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("cv"
    :base-directory "~/git/eew-cv"
    :base-extension "org"
    :publishing-directory "~/git/eew-cv-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("expert"
    :base-directory "~/git/eew-expert"
    :base-extension "org"
    :publishing-directory "~/git/eew-expert-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("today"
    :base-directory "~/git/eew-today"
    :base-extension "org"
    :publishing-directory "~/git/eew-today-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("w"
    :base-directory "~/git/w"
    :base-extension "org"
    :publishing-directory "~/git/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))
;; -------------------------------------------------------
(provide 'ew-org-mode-targets-a1)
;;; ew-org-mode-targets-a1 ends here
