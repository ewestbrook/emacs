;;; ew-org -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org")

(setq-default org-hide-emphasis-markers nil)
(setq-default org-hide-macro-markers nil)
(setq-default org-edit-src-content-indentation 0)
(setq-default org-src-tab-acts-natively t)
(setq-default org-src-fontify-natively t)
(setq-default org-support-shift-select 'always)
(setq-default org-startup-align-all-tables t)
(setq-default org-startup-folded nil)

(setq-default org-export-with-author nil)
(setq-default org-export-with-broken-links 'mark)
(setq-default org-export-with-creator nil)
(setq-default org-export-with-email nil)
(setq-default org-export-with-latex t)
(setq-default org-export-with-planning t)
(setq-default org-export-with-priority t)
(setq-default org-export-with-sub-superscripts '{})
(setq-default org-export-with-tags t)
(setq-default org-export-with-tasks t)
(setq-default org-export-with-title t)
(setq-default org-export-with-todo-keywords t)

(setq-default
 org-todo-keywords
 '((sequence "TODO" "INPROGRESS" "|" "DONE")))

;; open .org and .org.inc files in org-mode
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org.inc\\'" . org-mode))

;; file apps (launch instead of link)
(cond
 ((equal system-type 'gnu/linux)
  (add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))))

;; org-manage
(setq-default org-manage-directory-org "/git/org")

;; org-publish
(setq-default org-publish-list-skipped-files t)
(setq-default org-publish-use-timestamps-flag t)
;; (setq-default org-publish-use-timestamps-flag nil)

;; org-agenda
(setq-default org-agenda-files '("/git/org"))
;; (setq-default org-log-done "time")

;; org-clock
(setq-default org-clock-persist 'history)
(org-clock-persistence-insinuate)

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

(add-to-list
 'org-emphasis-alist
 '("*" (:foreground "red")))

;; org-table
(setq-default org-tags-column nil)

;; variable-pitch-mode
(add-hook
 'org-mode-hook
 (lambda () (variable-pitch-mode t)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("eo-" . "ew-org-"))
;; End:
(provide 'ew-org)
;;; ew-org.el ends here
