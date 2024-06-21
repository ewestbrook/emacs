;;; ew-fns-str2hex --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-str2hex.el")

(defun ew-str2hex (strg)
  (mapconcat (lambda (c) (format "%x" c)) strg ""))

(defun ew-region-str2hex (start end)
  (interactive "r")
  (replace-region-contents
   start
   end
   (lambda () (ew-str2hex (buffer-substring start end)))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-str2hex)
;;; ew-fns-str2hex.el ends here
