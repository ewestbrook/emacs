;;; ew-org-mode-targets-e1 -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(setq-default
 org-publish-project-alist
 '(

   ("w"
    :base-directory "/git/w/src"
    :base-extension "org"
    :publishing-directory "/git/w/h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("ew"
    :base-directory "/git/eo/ew"
    :base-extension "org"
    :publishing-directory "/git/eo/h/ew"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eewa"
    :base-directory "/git/eo/eewa"
    :base-extension "org"
    :publishing-directory "/git/eo/h/eewa"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("cv"
    :base-directory "/git/eo/cv"
    :base-extension "org"
    :publishing-directory "/git/eo/h/cv"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("expert"
    :base-directory "/git/eo/expert"
    :base-extension "org"
    :publishing-directory "/git/eo/h/expert"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("guru"
    :base-directory "/git/eo/guru"
    :base-extension "org"
    :publishing-directory "/git/eo/h/guru"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eng"
    :base-directory "/git/eo/eng"
    :base-extension "org"
    :publishing-directory "/git/eo/h/eng"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("minme"
    :base-directory "/git/eo/minme"
    :base-extension "org"
    :publishing-directory "/git/eo/h/minme"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("notes"
    :base-directory "/git/eo/notes"
    :base-extension "org"
    :publishing-directory "/git/eo/h/notes"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("schnauzers"
    :base-directory "/git/eo/schnauzers"
    :base-extension "org"
    :publishing-directory "/git/eo/h/schnauzers"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("smd"
    :base-directory "/git/eo/smd"
    :base-extension "org"
    :publishing-directory "/git/eo/h/smd"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("today"
    :base-directory "/git/eo/today"
    :base-extension "org"
    :publishing-directory "/git/eo/h/today"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("wwwwc"
    :base-directory "/git/eo/wwwwc"
    :base-extension "org"
    :publishing-directory "/git/eo/h/wwwwc"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))
;; -------------------------------------------------------
(provide 'ew-org-mode-targets-e1)
;;; ew-org-mode-targets-e1 ends here
