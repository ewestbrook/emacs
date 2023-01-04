;;; ew-package --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(defun ew-package-list ()
  "Return a list of all installed packages and their versions."
  (mapcar
   (lambda (pkg)
     `(,pkg ,(package-desc-version
                (cadr (assq pkg package-alist)))))
   package-activated-list))

;; (ewp-list)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-package)
;;; ew-package.el ends here
