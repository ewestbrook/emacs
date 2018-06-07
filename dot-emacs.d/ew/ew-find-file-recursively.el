;; -------------------------------------------------------
;; See https://github.com/suvayu/.emacs.d/blob/f9273fb40bf07d8dad851035a5a30878e5b6d697/lisp/nifty.el#L434

(defun sa-find-org-file-recursively
    (&optional directory filext)
  "Finds files recursively by extension."

  (interactive "DDirectory: ")

  (let*
      (org-file-list

       ;; filesystems are case sensitive
       (case-fold-search t)

       ;; exclude dot, autosave, and backup files
       (file-name-regex "^[^.#].*") 

       (filext (or filext "org$\\\|org_archive$"))

       (fileregex
        (format "%s\\.\\(%s$\\)" file-name-regex filext))

       (cur-dir-list
        (directory-files directory t file-name-regex)))

    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list)
      (cond
       ((file-regular-p file-or-dir)
        (if (string-match fileregex file-or-dir)
            (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)

        (dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
			  org-file-list) ; add files found to result
	  (add-to-list 'org-file-list org-file)))))))
;; -------------------------------------------------------
