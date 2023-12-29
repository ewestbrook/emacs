;;; ew --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package forge

  :ensure t

  :after magit

  :config
  (add-to-list
   'forge-alist
   '("gitlab.lanl.gov" "gitlab.lanl.gov/api/v4" "gitlab.lanl.gov" forge-gitlab-repository))

  (add-to-list
   'magit-clone-name-alist
   '("\\`\\(?:lanl:\\)\\([^:]+\\)\\'" "gitlab.lanl.gov" "gitlab.user"))

)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-forge)
;;; ew-forge.el ends here
