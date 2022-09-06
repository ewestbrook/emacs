;;; ew-os-linux --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-os-linux")

(if (equal system-type 'gnu/linux)
    (progn
      (setq-default browse-url-browser-function 'browse-url-firefox)
      (setq-default browse-url-new-window-flag  t)
      (setq-default browse-url-firefox-new-window-is-tab t)
      ;; (global-set-key (kbd "s-b") 'backward-word)
      ;; (global-set-key (kbd "s-f") 'forward-word)
      ;; (global-set-key (kbd "s-w") 'kill-ring-save)
      ;; (global-set-key (kbd "s-d") 'kill-word)
      ;; (global-set-key (kbd "s-t") 'transpose-words)

      (message "ew-os-linux: Linux")))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-os-linux)
;;; ew-os-linux.el ends here
