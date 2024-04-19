;;; ew-markdown --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-markdown.el")

(use-package markdown-mode

  :commands markdown-mode gfm-mode

  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)
         ;; ("README\\.md\\'" . gfm-mode)
         ))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-markdown)
;;; ew-markdown.el ends here
