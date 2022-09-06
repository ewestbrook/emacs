;;; ew-package --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-package")

(defun ewp-list ()
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
;; read-symbol-shorthands: (("ewp-" . "ew-package-"))
;; End:
(provide 'ew-package)
;;; ew-package.el ends here
