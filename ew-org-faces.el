;;; ew-org-faces -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-faces")

(if (display-graphic-p)
    (progn
      (add-hook
       'org-mode-hook
       (lambda ()

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
         (set-face-attribute 'org-block-begin-line nil :height 0.8)))))

;; (defvar ew-nevermind-faces '(org-link org-verbatim))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-faces)
;;; ew-org-faces.el ends here
