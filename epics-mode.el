;;; epics-mode --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(defun epics-mode-comment-regexp()
  "Comment regexp."
  "#.*$")

(defun epics-mode-keyword-regexp()
  "Keywords regexp."
  (rx (or "record" "field" "file" "pattern" "info")))

(rx-define
    epics-mode-whitespace
  (zero-or-more (or whitespace ?\n)))

(defun epics-mode-fieldrecord-arg1(keyword upper)
  "Field and record arg1 regexp.
Pass record or field as KEYWORD.
Pass t as UPPER if upper case only."
  `(seq
    word-start
    ,keyword
    epics-mode-whitespace
    "("
    epics-mode-whitespace
    (group (one-or-more ,(if upper 'upper-case 'letter)))
    epics-mode-whitespace
    ","
    ))

(rx-define
    epics-mode-fieldrecord-arg1 (keyword upper)
    (eval (epics-mode-fieldrecord-arg1 keyword upper)))

(defun epics-mode-field-name-regexp()
  "Field name regexp."
  (rx (epics-mode-fieldrecord-arg1 "field" t)))

(defun epics-mode-record-type-regexp()
  "Record type regexp."
  (rx (epics-mode-fieldrecord-arg1 "record" nil)))

(defvar epics-mode-font-lock-keywords nil "Font lock keywords.")
(setq-default
 epics-mode-font-lock-keywords
 `((,(epics-mode-comment-regexp)     . font-lock-comment-face)
   (,(epics-mode-keyword-regexp)     . font-lock-keyword-face)
   (,(epics-mode-record-type-regexp) (1 font-lock-type-face))
   (,(epics-mode-field-name-regexp)  (1 font-lock-constant-face))))

(defvar epics-mode-indent-level nil "Indent level.")
(setq-default epics-mode-indent-level 2)

;; If we are at the beginning of the buffer, indent to
;; column 0.  Calculate count of { and } in previous line
;; If net count is zero, indent same as previous line
;; Otherwise, increase/decrease indent from previous line
;; by (net count) * epics-mode-indent-level.  Finally,
;; unindent any lines that begin with some number of }.

;; TODO: exclude braces that are in quotes or comments.

(defun epics-mode-indent-line()
  "Indent current line."
  (interactive)
  (beginning-of-line)
  (if (not (eolp))
      (if (bobp)
          (indent-line-to 0)
        (let ((not-indented t)
              (netbraces 0)
              last-indent
              cur-indent)
          (save-excursion
            (forward-line -1)
            (setq last-indent (current-indentation))
            (beginning-of-line)
            (while (not (eolp))
              (if (looking-at "{")
                  (setq netbraces (+ netbraces 1))
                (if (looking-at "}")
                    (setq netbraces (- netbraces 1))))
              (forward-char)))
          (save-excursion
            (beginning-of-line)
            (while (not (eolp))
              (if (not (looking-at "[ \t}]"))
                  (end-of-line)
                (if (looking-at "}")
                    (setq netbraces (- netbraces 1)))
                (forward-char))))
          (setq cur-indent (+
                            last-indent
                            (* netbraces default-tab-width)))
          (if (< cur-indent 0)
              (setq cur-indent 0))
          (indent-line-to cur-indent)))))

(define-derived-mode epics-mode prog-mode "EPICS"
  "Major mode for EPICS files."

  (setq comment-start "#")
  (setq comment-end "")

  (setq-local
   font-lock-defaults
   '(epics-mode-font-lock-keywords ;; keywords
     nil                           ;; keywords-only
     nil                           ;; case-fold
     nil                           ;; syntax-alist
     nil                           ;; syntax-begin
     ))

  (setq-local indent-line-function #'epics-mode-indent-line)

  (font-lock-ensure))

;; (message "epics-mode go")

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'epics-mode)
;;; epics-mode.el ends here
