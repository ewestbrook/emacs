;;; ew-org-keys -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-org-keys.el")

(defun ew-org-hook ()
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

(add-hook 'org-mode-hook 'ew-org-hook)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-keys)
;;; ew-org-keys.el ends here
