;;; ew-package-fns --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(defun list-packages-and-versions ()
  "Returns a list of all installed packages and their versions"
  (mapcar
   (lambda (pkg)
     `(,pkg ,(package-desc-version
                (cadr (assq pkg package-alist)))))
   package-activated-list))
;; (list-packages-and-versions)
;; -------------------------------------------------------
(provide 'ew-package-fns)
;;; ew-package-fns ends here
