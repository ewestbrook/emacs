;;; ew-fns-autosave --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(defun make-auto-save-file-name ()
  "Return file name to use for auto-saves of current buffer.."
  (if buffer-file-name
      (if (file-exists-p "~/.emacs_autosaves/")
          (concat (expand-file-name "~/.emacs_autosaves/") "#"
                  (replace-regexp-in-string "/" "!" buffer-file-name)
                  "#")
        (concat
         (file-name-directory buffer-file-name)
         "#"
         (file-name-nondirectory buffer-file-name)
         "#"))
    (expand-file-name
     (concat "#%" (buffer-name) "#"))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-autosave)
;;; ew-fns-autosave.el ends here
