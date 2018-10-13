;;; org-mode -- Summary

;;; Commentary:
;;; Code:

(require 'org-bullets)
(require 'org-manage)
(require 'ob-http)
(require 'ox-twbs)
(require 'ox-reveal)

(load "ew-org-same-window")

(setq org-manage-directory-org "~/org")
(setq org-reveal-root "https://org.westbrook.io/revealjs")
;; (setq org-reveal-title-slide 'auto)
(setq org-reveal-title-slide nil)
(setq org-publish-list-skipped-files nil)

(setq org-agenda-files '("~/org"))
(setq org-clock-persist 'history)
(setq org-publish-use-timestamps-flag t)
;; (setq org-publish-use-timestamps-flag nil)

;; display various bullets for header levels
(setq org-hide-leading-stars t)
(setq org-bullets-bullet-list
      '("✸" "▶" "◆" "◉" "►" "" "•" "⋅"))
;; dots: 🔯 💠 ⸳ ⸱ ⸭ ⟐ ⋅ ⊡ ⊙ ⁛ ·
;; bullets: 

;; display bullet for non-header list items
(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-+]\\) "
    (0 (prog1 ()
         (compose-region
          (match-beginning 1)
          (match-end 1)
          "•"))))))

(setq org-hide-emphasis-markers t)
(setq org-hide-macro-markers t)
(setq org-tags-column nil)

(setq org-edit-src-content-indentation 0)
(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-support-shift-select 'always)

(setq org-publish-project-alist
 '(("org-notes"
    :base-directory "~/org/"
    :base-extension "org"
    :publishing-directory "~/org/h/"
    :recursive t
    :publishing-function org-twbs-publish-to-html
    :with-sub-superscript nil
    :auto-preamble t
    )))

;; (setq org-export-html-style-include-scripts nil)
;; (setq org-export-html-style-include-default nil)

(org-clock-persistence-insinuate)

(add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell      . t)
   (org        . t)
   (http       . t)
   (emacs-lisp . t)
   (ruby       . t)
   (latex      . t)
   (lua        . t)))

(defun ew-org-twbs-to-browser ()
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

(defun ew-org-reveal-to-browser ()
  "Call org-reveal-export-to-html-and-browse."
  (interactive)
  (save-buffer)
  (org-reveal-export-to-html-and-browse))

(defun ew-org-html-to-browser ()
  "Call org-html-export-to-html and browse."
  (interactive)
  (save-buffer)
  (browse-url (org-html-export-to-html)))

(defun ew-org-mode-hook ()
  "EW stuff specific to 'org-mode'."

  (org-bullets-mode 1)

  (local-set-key (kbd "C-c M-h") 'org-publish-all)

  (local-set-key (kbd "C-c h") 'ew-org-html-to-browser)
  (local-set-key (kbd "C-c H") 'org-html-export-to-html)

  (local-set-key (kbd "C-c r") 'ew-org-reveal-to-browser)
  (local-set-key (kbd "C-c R") 'ew-org-reveal-to-html)

  (local-set-key (kbd "C-c t") 'ew-org-twbs-to-browser)
  (local-set-key (kbd "C-c T") 'org-twbs-export-to-html)

  ;; (turn-on-visual-line-mode)
  )

(add-hook 'org-mode-hook 'ew-org-mode-hook)

;; (setq org-log-done "time")
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
