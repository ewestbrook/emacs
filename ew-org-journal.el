;;; ew-org-journal --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package org-journal
  :ensure t
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/org/journal/"
        org-journal-date-format "%F %T %Z"))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-journal)
;;; ew-org-journal.el ends here
