;;; ew-org-targets-ew -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-targets-ew")

(setq-default
 org-publish-project-alist
 '(

   ("budget-home"
    :base-directory "~/git/eew/budget"
    :base-extension "org"
    :publishing-directory "~/git/eew/budget-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("budget-volgit"
    :base-directory "/Volumes/git/eew/budget"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/budget-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("cv-home"
    :base-directory "~/git/eew/cv"
    :base-extension "org"
    :publishing-directory "~/git/eew/cv-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("cv-volgit"
    :base-directory "/Volumes/git/eew/cv"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/cv-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eew-lanl"
    :base-directory "~/git/eew/lanl"
    :base-extension "org"
    :publishing-directory "~/git/eew/lanl-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eewa-home"
    :base-directory "~/git/eo/eewa"
    :base-extension "org"
    :publishing-directory "~/git/eo/h/ew"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eewa-volgit"
    :base-directory "/Volumes/git/eo/eewa"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eo/h/ew"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eng-home"
    :base-directory "~/git/eo/eng"
    :base-extension "org"
    :publishing-directory "~/git/eo/h/eng"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("eng-volgit"
    :base-directory "/Volumes/git/eo/eng"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eo/h/eng"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("ew-home"
    :base-directory "~/git/eo/ew"
    :base-extension "org"
    :publishing-directory "~/git/eo/h/ew"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("ew-volgit"
    :base-directory "/Volumes/git/eo/ew"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eo/h/ew"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("expert-home"
    :base-directory "~/git/eew/expert"
    :base-extension "org"
    :publishing-directory "~/git/eew/expert-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("expert-volgit"
    :base-directory "/Volumes/git/eew/expert"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/expert-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("guru-home"
    :base-directory "~/git/eew/guru"
    :base-extension "org"
    :publishing-directory "~/git/eew/guru-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("guru-volgit"
    :base-directory "/Volumes/git/eew/guru"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/guru-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("manuals-home"
    :base-directory "~/git/eew/manuals"
    :base-extension "org"
    :publishing-directory "~/git/eew/manuals-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("manuals-volgit"
    :base-directory "/Volumes/git/eew/manuals"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/manuals-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("minme-home"
    :base-directory "~/git/eew/minme"
    :base-extension "org"
    :publishing-directory "~/git/eew/minme-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("minme-volgit"
    :base-directory "/Volumes/git/eew/minme"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/minme-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("schnauzers-home"
    :base-directory "~/git/eew/schnauzers"
    :base-extension "org"
    :publishing-directory "~/git/eew/schnauzers-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("schnauzers-volgit"
    :base-directory "/Volumes/git/eew/schnauzers"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/schnauzers-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("smd-home"
    :base-directory "~/git/eew/smd"
    :base-extension "org"
    :publishing-directory "~/git/eew/smd-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("smd-volgit"
    :base-directory "/Volumes/git/eew/smd"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/smd-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("teambest-home"
    :base-directory "~/git/eew/teambest"
    :base-extension "org"
    :publishing-directory "~/git/eew/teambest-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("teambest-volgit"
    :base-directory "/Volumes/git/eew/teambest"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/teambest-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("today-home"
    :base-directory "~/git/eew/today"
    :base-extension "org"
    :publishing-directory "~/git/eew/today-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("today-git"
    :base-directory "/git/eew/today"
    :base-extension "org"
    :publishing-directory "/git/eew/today-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("today-volgit"
    :base-directory "/Volumes/git/eew/today"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/today-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("w-home"
    :base-directory "~/git/eew/w/src"
    :base-extension "org"
    :publishing-directory "~/git/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("w-volgit"
    :base-directory "/Volumes/git/eew/w/src"
    :base-extension "org"
    :publishing-directory "/Volumes/git/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("wwwwc-home"
    :base-directory "~/git/eew/wwwwc"
    :base-extension "org"
    :publishing-directory "~/git/eew/wwwwc-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("wwwwc-volgit"
    :base-directory "/Volumes/git/eew/wwwwc"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/wwwwc-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-targets-ew)
;;; ew-org-targets-ew.el ends here
