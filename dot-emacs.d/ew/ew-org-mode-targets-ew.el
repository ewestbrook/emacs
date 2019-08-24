;;; ew-org-mode-targets-ew -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets-ew")
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

   ("eewa"
    :base-directory "~/git/eo/eewa"
    :base-extension "org"
    :publishing-directory "~/git/eo/h/ew"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eng"
    :base-directory "~/git/eo/eng"
    :base-extension "org"
    :publishing-directory "~/git/eo/h/eng"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("ew"
    :base-directory "~/git/eo/ew"
    :base-extension "org"
    :publishing-directory "~/git/eo/h/ew"
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

   ("guru"
    :base-directory "~/git/eew-guru"
    :base-extension "org"
    :publishing-directory "~/git/eew-guru-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("minme"
    :base-directory "~/git/eew-minme"
    :base-extension "org"
    :publishing-directory "~/git/eew-minme-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("schnauzers"
    :base-directory "~/git/eew-schnauzers"
    :base-extension "org"
    :publishing-directory "~/git/eew-schnauzers-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("smd"
    :base-directory "~/git/eew-smd"
    :base-extension "org"
    :publishing-directory "~/git/eew-smd-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("teambest"
    :base-directory "~/git/eewa-teambest"
    :base-extension "org"
    :publishing-directory "~/git/eewa-teambest-h"
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
    :base-directory "~/git/w/src"
    :base-extension "org"
    :publishing-directory "~/git/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("wwwwc"
    :base-directory "~/git/eew-wwwwc"
    :base-extension "org"
    :publishing-directory "~/git/eew-wwwwc-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))
;; -------------------------------------------------------
(provide 'ew-org-mode-targets-ew)
;;; ew-org-mode-targets-ew ends here
