;;; ew-org-fns -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-fns")

(defun ewo-publish-to-browser ()
  "Export an 'org-mode' file to twbs html, then open the html file in a browser."
  (interactive)
  (save-buffer)
  (save-excursion (org-publish-current-file))
  (let*

      ((proj
        (org-publish-get-project-from-filename
         buffer-file-name))

       (proj-plist (cdr proj))

       (rel
        (file-relative-name
         buffer-file-name
         (plist-get proj-plist :base-directory)))

       (dest
        (plist-get proj-plist :publishing-directory)))

    (browse-url
     (concat
      "file://"
      (file-name-as-directory (expand-file-name dest))
      (file-name-sans-extension rel)
      ".html"))

    ))

(defun ewo-html-to-browser ()
  "Call org-html-export-to-html and browse."
  (interactive)
  (save-buffer)
  (browse-url (org-html-export-to-html)))

(defun ewo-publish-current-file ()
  "Publish current file, forcibly."
  (interactive)
  (org-publish-current-file t))

(defun ewo-mode-noindex (L)
  "Remove index.org from a list L of cwd files."
  (cond

   ((null L) nil)

   ((string-match "index\\.org$" (car L))
    (ewo-mode-noindex (cdr L)))

   (t
    (cons (car L) (ewo-mode-noindex (cdr L))))))

(defun ewo-mode-cwd-org-files ()
  "Return a list of the org files in the current directory."
  (ewo-mode-noindex
   (directory-files "." nil "^[^.].*\\.org$")))

(defun ewo-mode-cwd-org-files-tree ()
  "Return a list of the org files in the current directory, recursively."
  (ewo-mode-noindex
   (directory-files-recursively "." "^[^.].*\\.org$")))

(defun ewo-make-all ()
  "Remove all timestamps and then publish current project."
  (interactive)
  (org-publish-remove-all-timestamps)
  (org-publish-current-project))

(defun ewo-publish-open-buffers()
  "Publish open 'org-mode' buffers."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'org-mode
                    (buffer-local-value
                     'major-mode buffer))
            (switch-to-buffer buffer)
            (org-publish-current-file t)))
        (buffer-list)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewo-" . "ew-org-"))
;; End:
(provide 'ew-org-fns)
;;; ew-org-fns.el ends here
