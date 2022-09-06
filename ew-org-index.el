;;; ew-org-index --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-org-index")

(require 'ew-dir)

(setq-default
 ewoi-except-bns
 ["index.org" "." ".." "c" "i" "j"])

(defun ewoi-get-title-from-file (file)
  "Get title string from `FILE`."
  (format "go to %s" file))

(defun ewoi-file-from-bn (bn)
  "Get relative file path from basename `BN`."
  (if (string-match "\\.org$" bn)
      bn
    (format "%s/index.org" bn)))

(defun ewoi-file-link (file)
  "Make link from `FILE`."
  (format
   "  + [[./%s][%s]]\n"
   file
   (ewoi-get-title-from-file file)))

(defun ewoi-bn-link (bn)
  "Make link from `BN`."
  (ewoi-file-link
   (ewoi-file-from-bn bn)))

(defun ewoi-bns ()
  "Get list of elegible BNs in current directory."
  (ew-dir-cwd-bns-except
   ewoi-except-bns))

(defun ewoi-links ()
  "Make set of all index links for current directory."
  (seq-map
   'ewoi-bn-link
   (ewoi-bns)))

(defun ew-org-index ()
  "Concatenate string of links for current directory."
  (apply 'concat (ewoi-links)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewoi-" . "ew-org-index-"))
;; End:
(provide 'ew-org-index)
;;; ew-org-index.el ends here
