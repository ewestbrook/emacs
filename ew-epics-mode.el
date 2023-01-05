;;; ew-epics-mode --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package epics-mode
  :ensure nil
  :mode (("\\.db" . epics-mode)
         ("\\.template" . epics-mode)
         ("\\.substitutions" . epics-mode)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-epics-mode)
;;; ew-epics-mode.el ends here
