;;; ew-org -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-org.el")

(use-package org

  :mode (("\\.org\\'" . org-mode)
         ("\\.org.inc\\'" . org-mode))

  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-switchb))

  :preface

  (defun ew-org-varpitchmode()
    "Set 'variable-pitch-mode'."
    (variable-pitch-mode t))

  (defun ew-org-faces()
    "Set EW org faces."
    (let ((prop-face "Noto Sans"))
           (mapc
            (lambda (f)
              (set-face-attribute f nil :family prop-face))
            '(org-default
              org-document-title
              org-level-1
              org-level-2
              org-level-3
              org-level-4
              org-level-5
              org-level-6
              org-level-7
              org-level-8)))

         (let ((mono-face "JetBrains Mono"))
           (mapc
            (lambda (f)
              (set-face-attribute f nil :family mono-face))
            '(org-block-begin-line
              org-meta-line
              org-code
              org-verbatim
              org-block
              org-date
              org-link
              org-table)))

         (set-face-attribute 'org-document-title   nil :height 1.8)
         (set-face-attribute 'org-level-1          nil :height 1.5)
         (set-face-attribute 'org-level-2          nil :height 1.3)
         (set-face-attribute 'org-level-3          nil :height 1.2)
         (set-face-attribute 'org-block-begin-line nil :height 0.8))

  :hook ((org-mode . ew-org-varpitchmode)
         (org-mode . ew-org-faces))

  :config

  (setq org-hide-emphasis-markers        nil)
  (setq org-hide-macro-markers           nil)
  (setq org-edit-src-content-indentation 0)
  (setq org-src-tab-acts-natively        t)
  (setq org-src-fontify-natively         t)
  (setq org-support-shift-select         'always)
  (setq org-startup-align-all-tables     t)
  (setq org-startup-folded               nil)
  (setq org-manage-directory-org         "/git/org")
  (setq org-publish-list-skipped-files   t)
  (setq org-publish-use-timestamps-flag  t)
  (setq org-clock-persist                'history)
  (setq org-tags-column                  nil)
  (setq org-confirm-babel-evaluate       t)
  (setq safe-local-variable-values       '((org-confirm-babel-evaluate)))
  ;; (setq org-agenda-files                 '("/git/org"))
  ;; (setq org-log-done                     "time")

  (setq org-todo-keywords
        '((sequence "TODO" "INPROGRESS" "|" "DONE")))

  (cond
   ((equal system-type 'gnu/linux)
    (add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))))

  (org-clock-persistence-insinuate)

  (font-lock-add-keywords
   'org-mode
   '(("^ *\\([-+]\\) "
      (0 (prog1 ()
           (compose-region
            (match-beginning 1)
            (match-end 1)
            "•"))))))

  (add-to-list
   'org-emphasis-alist
   '("*" (:foreground "red")))

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
     (dot        . t)
     (ditaa      . t)))

  (setq
   org-src-lang-modes
   '(("C"         . c)
     ("C++"       . c++)
     ("asymptote" . asy)
     ("bash"      . sh)
     ("calc"      . fundamental)
     ("cpp"       . c++)
     ("css"       . css)
     ("ditaa"     . artist)
     ("dot"       . graphviz-dot)
     ("elisp"     . emacs-lisp)
     ("html"      . web)
     ("ocaml"     . tuareg)
     ("screen"    . shell-script)
     ("shell"     . sh)
     ("sqlite"    . sql)
     ("lua"       . lua)))

  )

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org)
;;; ew-org.el ends here
