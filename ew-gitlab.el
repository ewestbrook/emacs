;;; ew-gitlab --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package f

  :ensure t

)

(use-package gitlab

  :ensure t

  :after f

  :config
  (setq gitlab-host "https://gitlab.lanl.gov"
        gitlab-token-id "glpat-qzDgbt8uxHoNC8xcv43U")

)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-gitlab)
;;; ew-gitlab.el ends here
