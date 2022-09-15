;;; ew-company -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-company")

(if (display-graphic-p)
    (add-hook
     'company-mode-hook
     (lambda ()

       (set-face-attribute 'company-tooltip           nil :background "#282828")
       (set-face-attribute 'company-tooltip           nil :foreground "#dd00dd")
       (set-face-attribute 'company-tooltip-selection nil :background "#282828")
       (set-face-attribute 'company-tooltip-selection nil :foreground "#dddd00")
       (set-face-attribute 'company-scrollbar-bg      nil :background "#404040"))))

(setq company-global-modes '(not org-mode))
(add-hook 'after-init-hook 'global-company-mode)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-company)
;;; ew-company.el ends here
