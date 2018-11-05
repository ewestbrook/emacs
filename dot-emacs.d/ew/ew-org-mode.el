;;; ew-org-mode -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(require 'org-bullets)
(require 'org-manage)
(require 'ob-http)
(require 'ox-twbs)
(require 'ox-reveal)
;; -------------------------------------------------------
(load "ew-twbs")
(load "ew-org-same-window")
;; -------------------------------------------------------
;; org generally
(setq-default org-hide-emphasis-markers t)
(setq-default org-hide-macro-markers t)
(setq-default org-edit-src-content-indentation 0)
(setq-default org-src-tab-acts-natively t)
(setq-default org-src-fontify-natively t)
(setq-default org-support-shift-select 'always)
;; -------------------------------------------------------
;; file apps (launch instead of link)
(add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))
;; -------------------------------------------------------
;; org-babel evaluate with/without confirmation
(setq-default org-confirm-babel-evaluate t)
;; -------------------------------------------------------
;; mark the above as safe for setting in mode line
;; note: use # -*- org-confirm-babel-evaluate: nil -*-
;; at top of files for per-file automatic evaluation
;; (also note the asterisks will disappear)
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
;; org-manage
(setq-default org-manage-directory-org "~/org")
;; -------------------------------------------------------
;; org-reveal
(setq-default org-reveal-root "https://org.westbrook.io/revealjs")
(setq-default org-reveal-title-slide nil)
;; (setq-default org-reveal-title-slide 'auto)
;; -------------------------------------------------------
;; org-publish
(setq-default org-publish-list-skipped-files t)
(setq-default org-publish-use-timestamps-flag t)
;; (setq-default org-publish-use-timestamps-flag nil)
;; -------------------------------------------------------
;; org-agenda
(setq-default org-agenda-files '("~/org"))
;; (setq-default org-log-done "time")
;; -------------------------------------------------------
;; org-clock
(setq-default org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; -------------------------------------------------------
;; org-bullets
(setq-default org-hide-leading-stars t)
(setq-default org-bullets-bullet-list
      '("✸" "▶" "◆" "◉" "►" "" "•" "⋅"))
;; more dots: 🔯 💠 ⸳ ⸱ ⸭ ⟐ ⋅ ⊡ ⊙ ⁛ ·
;; display bullet for non-header list items
(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-+]\\) "
    (0 (prog1 ()
         (compose-region
          (match-beginning 1)
          (match-end 1)
          "•"))))))
;; -------------------------------------------------------
;; org-table
(setq-default org-tags-column nil)
;; -------------------------------------------------------
;; org-publish
(setq-default org-publish-project-alist
 '(("git-org"
    :base-directory "/git/org/"
    :base-extension "org"
    :publishing-directory "/git/org/h/"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :with-sub-superscript nil
    :auto-preamble t
    )))
;; (setq-default org-export-html-style-include-scripts nil)
;; (setq-default org-export-html-style-include-default nil)
;; -------------------------------------------------------
;; ew functions
;; -------------------------------------------------------
(defun ew-org-publish-to-browser ()
  "Export an 'org-mode' file to twbs html, then open the html file in a browser."
  (interactive)
  (save-buffer)
  (save-excursion (org-publish-current-file))
  (let*

      ((proj
        (org-publish-get-project-from-filename
         buffer-file-name))

       (proj-plist (cdr proj))

       (rel
        (file-relative-name
         buffer-file-name
         (plist-get proj-plist :base-directory)))

       (dest
        (plist-get proj-plist :publishing-directory)))

    (browse-url
     (concat
      "file://"
      (file-name-as-directory (expand-file-name dest))
      (file-name-sans-extension rel)
      ".html"))

    ))
;; -------------------------------------------------------
(defun ew-org-reveal-to-browser ()
  "Call org-reveal-export-to-html-and-browse."
  (interactive)
  (save-buffer)
  (org-reveal-export-to-html-and-browse))
;; -------------------------------------------------------
(defun ew-org-html-to-browser ()
  "Call org-html-export-to-html and browse."
  (interactive)
  (save-buffer)
  (browse-url (org-html-export-to-html)))
;; -------------------------------------------------------
(defun ew-org-publish-current-file ()
  "Publish current file, forcibly."
  (interactive)
  (let (priorflag)
    (setq priorflag org-publish-use-timestamps-flag)
    (setq org-publish-use-timestamps-flag nil)
    (org-publish-current-file)
    (setq org-publish-use-timestamps-flag priorflag)))
;; -------------------------------------------------------
(defun ew-org-mode-hook ()
  "EW stuff specific to 'org-mode'."

  (org-bullets-mode 1)

  (local-set-key (kbd "C-c M-h") 'org-publish-all)

  (local-set-key (kbd "C-c h") 'ew-org-html-to-browser)
  (local-set-key (kbd "C-c H") 'org-html-export-to-html)

  (local-set-key (kbd "C-c r") 'ew-org-reveal-to-browser)
  (local-set-key (kbd "C-c R") 'ew-org-reveal-to-html)

  (local-set-key (kbd "C-c t") 'ew-org-publish-to-browser)
  (local-set-key (kbd "C-c T") 'org-twbs-export-to-html)

  (local-set-key (kbd "C-c C-x h") 'ew-org-publish-current-file)

  (local-set-key (kbd "C-c C-x m") 'org-display-inline-images)
  ;; (turn-on-visual-line-mode)
  )

(add-hook 'org-mode-hook 'ew-org-mode-hook)
;; -------------------------------------------------------
;; Export UTF-8 checkboxes
(defun sacha/org-html-checkbox (checkbox)
  "Format CHECKBOX into HTML."
  (case checkbox (on "<span class=\"check\">&#x2611;</span>")
        ;; checkbox (checked)
        (off "<span class=\"checkbox\">&#x2610;</span>")
        (trans "<code>[-]</code>")
        (t "")))
(defadvice org-html-checkbox (around sacha activate)
  (setq ad-return-value (sacha/org-html-checkbox (ad-get-arg 0))))
;; -------------------------------------------------------
(provide 'ew-org-mode)
;;; ew-org-mode ends here
;; -------------------------------------------------------
