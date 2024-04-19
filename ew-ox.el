;;; ew-ox -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-ox.el")

(use-package ox
  :ensure nil
  :config
  (setq org-export-with-author           nil)
  (setq org-export-with-broken-links     'mark)
  (setq org-export-with-creator          nil)
  (setq org-export-with-email            nil)
  (setq org-export-with-latex            t)
  (setq org-export-with-planning         t)
  (setq org-export-with-priority         t)
  (setq org-export-with-sub-superscripts '{})
  (setq org-export-with-tags             t)
  (setq org-export-with-tasks            t)
  (setq org-export-with-title            t)
  (setq org-export-with-todo-keywords    t))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-ox)
;;; ew-ox.el ends here
