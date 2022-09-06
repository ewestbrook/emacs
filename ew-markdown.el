;;; ew-markdown --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-markdown")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist
             '("\\.markdown\\'" . markdown-mode))

(add-to-list 'auto-mode-alist
             '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for GitHub Flavored Markdown files" t)

(add-to-list 'auto-mode-alist
             '("README\\.md\\'" . gfm-mode))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-markdown)
;;; ew-markdown.el ends here
