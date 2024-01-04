;;; ew-magit -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package forge

  :ensure t
  :after magit
  :config
  (add-to-list
   'forge-alist
   '("gitlab.lanl.gov" "gitlab.lanl.gov/api/v4" "gitlab.lanl.gov" forge-gitlab-repository)))

(use-package magit

  :ensure t

  :preface
  (defun ew-magit-status-mode-init()
    "Init magit status mode."
    (if (display-graphic-p)
        (progn
          (set-face-attribute 'magit-section-heading        nil :family "Noto Sans")
          (set-face-attribute 'magit-section-heading        nil :height 1.6)
          (set-face-attribute 'magit-diff-context           nil :background "#242424")
          (set-face-attribute 'magit-diff-added             nil :background "#204020")
          (set-face-attribute 'magit-diff-added             nil :foreground "#cccccc")
          (set-face-attribute 'magit-diff-removed           nil :background "#402020")
          (set-face-attribute 'magit-diff-removed           nil :foreground "#cccccc")
          (set-face-attribute 'magit-diff-context-highlight nil :background "#3a3a3a")
          (set-face-attribute 'magit-diff-removed-highlight nil :background "#633f3e")
          (set-face-attribute 'magit-diff-added-highlight   nil :background "#3a5c40"))
      (progn
        (set-face-attribute 'magit-log-date                    nil :foreground "grey50")
        (set-face-attribute 'magit-diff-hunk-heading           nil :foreground "grey60")
        (set-face-attribute 'magit-diff-hunk-heading           nil :background "grey30")
        (set-face-attribute 'magit-diff-hunk-heading-highlight nil :background "grey70")
        (set-face-attribute 'magit-section-highlight           nil :background "#333333")
        (set-face-attribute 'magit-diff-context-highlight      nil :background "grey15")
        (set-face-attribute 'magit-diff-added-highlight        nil :background "#224422")
        (set-face-attribute 'magit-diff-added-highlight        nil :foreground "#66ee66")
        (set-face-attribute 'magit-diff-added                  nil :background "#224422")
        (set-face-attribute 'magit-diff-added                  nil :foreground "#00aa00")
        (set-face-attribute 'diff-refine-added                 nil :background "#114411")
        (set-face-attribute 'diff-refine-added                 nil :foreground "#88ff88")
        (set-face-attribute 'magit-diff-removed-highlight      nil :background "#442222")
        (set-face-attribute 'magit-diff-removed-highlight      nil :foreground "#ee6666")
        (set-face-attribute 'magit-diff-removed                nil :background "#441111")
        (set-face-attribute 'magit-diff-removed                nil :foreground "#aa4444")
        (set-face-attribute 'diff-refine-removed               nil :background "#441111")
        (set-face-attribute 'diff-refine-removed               nil :foreground "#ff8888")))
    (setq forge-topic-list-order '(number . >)))

  :hook (magit-status-mode . ew-magit-status-mode-init)

  :config
  (setq magit-diff-hide-trailing-cr-characters t)
  (setq magit-diff-highlight-trailing t)
  (setq magit-diff-paint-whitespace t)
  (setq magit-diff-refine-hunk 'all)
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  (setq magit-section-initial-visibility-alist
        '((stashes . hide)
          (untracked . show)
          (unstaged . show)
          (unpushed . show)
          (issues . show)
          (pullreqs . show)))
  (setq magit-repository-directories
        '(("~/git" . 5)
          ("/usr/local/eric/git" . 5))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-magit)
;;; ew-magit.el ends here
