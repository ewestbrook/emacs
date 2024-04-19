;;; ew-fns-org-index --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-org-index.el")

(require 'ew-fns-dir)

(setq-default
 ew-org-index-except-bns
 ["index.org" "." ".." "c" "i" "j"])

(defun ew-org-index-get-title-from-file (file)
  "Get title string from `FILE`."
  (format "go to %s" file))

(defun ew-org-index-file-from-bn (bn)
  "Get relative file path from basename `BN`."
  (if (string-match "\\.org$" bn)
      bn
    (format "%s/index.org" bn)))

(defun ew-org-index-file-link (file)
  "Make link from `FILE`."
  (format
   "  + [[./%s][%s]]\n"
   file
   (ew-org-index-get-title-from-file file)))

(defun ew-org-index-bn-link (bn)
  "Make link from `BN`."
  (ew-org-index-file-link
   (ew-org-index-file-from-bn bn)))

(defun ew-org-index-bns ()
  "Get list of elegible BNs in current directory."
  (ew-dir-cwd-bns-except
   ew-org-index-except-bns))

(defun ew-org-index-links ()
  "Make set of all index links for current directory."
  (seq-map
   'ew-org-index-bn-link
   (ew-org-index-bns)))

(defun ew-org-index ()
  "Concatenate string of links for current directory."
  (apply 'concat (ew-org-index-links)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-org-index)
;;; ew-fns-org-index.el ends here
