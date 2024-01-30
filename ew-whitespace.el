;;; ew-whitespace -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

;; see also the builtins whitespace-cleanup and
;; whitespace-cleanup-region from whitespace.el.gz

(require 'whitespace)

(defun ew-whitespace-cleanup()
  (interactive)
  (save-excursion
    ;; PROBLEM 1: empty lines at bob
    ;; PROBLEM 2: empty lines at eob
    ;; ACTION: remove all empty lines at bob and/or eob
    (when (memq 'empty whitespace-style)
      (let (overwrite-mode)		; enforce no overwrite
        (goto-char (point-min))
        (when (looking-at whitespace-empty-at-bob-regexp)
          (delete-region (match-beginning 1) (match-end 1)))
        (when (re-search-forward
               whitespace-empty-at-eob-regexp nil t)
          (delete-region (match-beginning 1) (match-end 1))))))
  (ew-whitespace-cleanup-region (point-min) (point-max)))

(defun ew-whitespace-cleanup-region(start end)
  (interactive)
  ;; PROBLEM 3: SPACEs or TABs at eol
  ;; ACTION: remove all SPACEs or TABs at eol
  (save-excursion
    (let ((rstart           (min start end))
	        (rend             (copy-marker (max start end)))
	        overwrite-mode		; enforce no overwrite
	        tmp)
      (when (memq 'trailing whitespace-style)
        (whitespace-replace-action
         'delete-region rstart rend
         whitespace-trailing-regexp 1)))))

(add-hook 'before-save-hook 'ew-whitespace-cleanup)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-whitespace)
;;; ew-whitespace.el ends here
