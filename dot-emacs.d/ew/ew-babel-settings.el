;;; ew-babel-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; org-babel evaluate with (t) or without (nil) confirming
(setq-default org-confirm-babel-evaluate t)
;; -------------------------------------------------------
;; mark the above as safe for setting in mode line
;; note: use # -*- org-confirm-babel-evaluate: nil -*-
;; at top of files for per-file automatic evaluation
;; (also note the asterisks will disappear in org-mode)
(setq-default safe-local-variable-values
      '((org-confirm-babel-evaluate)))
;; -------------------------------------------------------
;; org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell      . t)
   (org        . t)
   (http       . t)
   (emacs-lisp . t)
   (ruby       . t)
   (latex      . t)
   (lua        . t)
   (python     . t)
   (sqlite     . t)
   (dot        . t)))
;; -------------------------------------------------------
;; org-src-lang-modes
(setq
 org-src-lang-modes
 '(
   ("C" . c)
   ("C++" . c++)
   ("asymptote" . asy)
   ("bash" . sh)
   ("calc" . fundamental)
   ("cpp" . c++)
   ("css" . css)
   ("ditaa" . artist)
   ("dot" . graphviz-dot)
   ("elisp" . emacs-lisp)
   ("html" . web)
   ("ocaml" . tuareg)
   ("screen" . shell-script)
   ("shell" . sh)
   ("sqlite" . sql)
   ("lua" . lua)
   ))
;; -------------------------------------------------------
(provide 'ew-babel-settings)
;;; ew-babel-settings ends here
