;;; ew-org-mode-fns -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-mode-fns")
;; -------------------------------------------------------
(defun ew-org-publish-to-browser ()
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
;; -------------------------------------------------------
(defun ew-org-html-to-browser ()
  "Call org-html-export-to-html and browse."
  (interactive)
  (save-buffer)
  (browse-url (org-html-export-to-html)))
;; -------------------------------------------------------
(defun ew-org-publish-current-file ()
  "Publish current file, forcibly."
  (interactive)
  (org-publish-current-file t))
;; -------------------------------------------------------
(defun ew-org-mode-noindex (L)
  "Remove index.org from a list L of cwd files."
  (cond

   ((null L) nil)

   ((string-match "index\\.org$" (car L))
    (ew-org-mode-noindex (cdr L)))

   (t
    (cons (car L) (ew-org-mode-noindex (cdr L))))))
;; -------------------------------------------------------
(defun ew-org-mode-cwd-org-files ()
  "Return a list of the org files in the current directory."
  (ew-org-mode-noindex
   (directory-files "." nil "^[^.].*\\.org$")))
;; -------------------------------------------------------
(defun ew-org-mode-cwd-org-files-tree ()
  "Return a list of the org files in the current directory, recursively."
  (ew-org-mode-noindex
   (directory-files-recursively "." "^[^.].*\\.org$")))
;; -------------------------------------------------------
(provide 'ew-org-mode-fns)
;;; ew-org-mode-fns ends here
