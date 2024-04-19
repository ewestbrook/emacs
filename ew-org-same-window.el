;;; ew-org-same-window --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-org-same-window.el")

;; see https://emacs.stackexchange.com/a/17163

;; Macro which creates advice 'template'
(defmacro my/with-advice (adlist &rest body)

  "Execute BODY with temporary advice in ADLIST.

Each element of ADLIST should be a list of the form
  (SYMBOL WHERE FUNCTION [PROPS])
suitable for passing to `advice-add'.  The BODY is
wrapped in an `unwind-protect' form, so the advice
will be removed even in the event of an error or
nonlocal exit."

  (declare
   (debug ((&rest (&rest form)) body))
   (indent 1))

  `(progn
     ,@(mapcar
        (lambda (adform) (cons 'advice-add adform))
        adlist)
     (unwind-protect (progn ,@body)
       ,@(mapcar
          (lambda (adform)
            `(advice-remove
              ,(car adform)
              ,(nth 2 adform)))
          adlist))))

;; Function which replaces org-switch-to-buffer-other-window with emacs' original switch-to-buffer-other-window

(defun hd/org-todo-same-window (orig-fn)

  "Advice to fix window placement in `org-fast-todo-selection'."

  ;; locally sets variable "override" as key-value pair for display-buffer-alist entry
  (let ((override
         '("\\*Org todo\\*|\\*Org Note\\*"
           (display-buffer-use-some-window)
           (inhibit-same-window . nil))))

    ;; adds the contents of the above defined variable to display-buffer-alist
    (add-to-list 'display-buffer-alist override)

    (my/with-advice

        ((#'org-switch-to-buffer-other-window
          :override #'switch-to-buffer-other-window))

      (unwind-protect (funcall orig-fn)
        (setq display-buffer-alist
              (delete override display-buffer-alist))))))

;; Injecting the relevant advice into the org-fast-todo-selection function
(advice-add
 #'org-fast-todo-selection
 :around #'hd/org-todo-same-window)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-same-window)
;;; ew-org-same-window.el ends here
