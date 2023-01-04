;;; ew-magit -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package magit

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
          (set-face-attribute 'magit-diff-added-highlight   nil :background "#3a5c40"))))

  ;; :bind ("\C-xg" . magit-status)

  :hook (magit-status-mode . ew-magit-status-mode-init)

  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  (setq magit-diff-refine-hunk 'all)
  (setq magit-diff-paint-whitespace t)
  (setq magit-diff-highlight-trailing t)
  (setq magit-diff-hide-trailing-cr-characters t)
  (setq magit-repository-directories '(("~/git" . 5))))

;; (global-set-key "\C-xg" 'magit-status)

;; (setq-default magit-git-executable "/usr/local/bin/git")
;; (setq-default magit-git-executable "git")

;; (add-to-list 'magit-section-initial-visibility-alist '(@{upstream} . show))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-magit)
;;; ew-magit.el ends here
