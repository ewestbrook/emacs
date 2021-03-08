;;; ew-org-mode-targets-lanl -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-targets-lanl")
;; -------------------------------------------------------
(setq-default
 org-publish-project-alist
 '(

   ("eew-lanl"
    :base-directory "~/git/eew/lanl"
    :base-extension "org"
    :publishing-directory "~/git/eew/lanl-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("aotic-mediawikifiles"
    :base-directory "~/git/aot-ic/mediawikifiles"
    :base-extension "org"
    :publishing-directory "~/git/aot-ic/mediawikifiles-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("lanlpres-home"
    :base-directory "~/git/eew/lanlpres"
    :base-extension "org"
    :publishing-directory "~/git/eew/lanlpres-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("lanlpres-volume"
    :base-directory "/Volumes/git/eew/lanlpres"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/lanlpres-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("mgmt-home"
    :base-directory "~/git/eew/mgmt"
    :base-extension "org"
    :publishing-directory "~/git/eew/mgmt-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("mgmt-volume"
    :base-directory "/Volumes/git/eew/mgmt"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/mgmt-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("w-home"
    :base-directory "~/git/eew/w/src"
    :base-extension "org"
    :publishing-directory "~/git/eew/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("w-volume"
    :base-directory "/Volumes/git/eew/w/src"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew/w-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("lcsdemo-home"
    :base-directory "~/git/eew-lcsdemo"
    :base-extension "org"
    :publishing-directory "~/git/eew-lcsdemo-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("lcsdemo-volume"
    :base-directory "/Volumes/git/eew-lcsdemo"
    :base-extension "org"
    :publishing-directory "/Volumes/git/eew-lcsdemo-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("lcslinux-home"
    :base-directory "~/git/aot-ic/lcslinux"
    :base-extension "org"
    :publishing-directory "~/git/aot-ic/lcslinux-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ("lcslinux-volume"
    :base-directory "/Volumes/git/aot-ic/lcslinux"
    :base-extension "org"
    :publishing-directory "/Volumes/git/aot-ic/lcslinux-h"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :auto-preamble nil)

   ))
(provide 'ew-org-mode-targets-lanl)
;;; ew-org-mode-targets-lanl ends here
