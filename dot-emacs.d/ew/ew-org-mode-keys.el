;;; ew-org-mode-keys -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-keys")
;; -------------------------------------------------------
(defun ew-org-mode-hook ()
  "EW stuff specific to 'org-mode'."

  (org-bullets-mode 1)

  (local-set-key (kbd "C-c h") 'ew-org-publish-current-file)
  (local-set-key (kbd "C-c H") 'ew-org-publish-to-browser)
  (local-set-key (kbd "C-c M-h") 'ew-org-make-all)

  (local-set-key (kbd "C-c r") 'ew-org-reveal-to-browser)
  (local-set-key (kbd "C-c R") 'ew-org-reveal-to-html)

  (local-set-key (kbd "C-c C-x m") 'org-display-inline-images)
  ;; (turn-on-visual-line-mode)

  (local-set-key (kbd "C-c 1") 'org-time-stamp-inactive)
  )

(add-hook 'org-mode-hook 'ew-org-mode-hook)
;; -------------------------------------------------------
(provide 'ew-org-mode-keys)
;;; ew-org-mode-keys ends here
