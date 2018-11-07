;;; ew-ox-html -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(setq-default org-html-with-latex `dvipng)
;; -------------------------------------------------------
(setq-default org-html-head-include-scripts nil)
(setq-default org-html-head-include-default-style t)
;; -------------------------------------------------------
(setq-default org-html-head-extra "
<link rel=\"stylesheet\" href=\"c/ewoxhtml.css\">
")
;; -------------------------------------------------------
(setq-default org-html-home/up-format "")
;; -------------------------------------------------------
(setq-default
 org-html-preamble-format
 '(("en" "
<ul>
  <li><a href=\"%H\">home</a></li>
  <li><a href=\"%U\">up</a></li>
  <li>%t</li>
  <li>%a</li>
</ul>
")))
(setq-default org-html-preamble t)
;; -------------------------------------------------------
(setq-default
 org-html-postamble-format
 '(("en" "
<ul>
  <li>%a</li>
  <li>%C</li>
</ul>
")))
(setq-default org-html-postamble t)
;; -------------------------------------------------------
(setq-default
 org-html-table-default-attributes
 '(:class "ewoxhtml-table"
          :border nil
          :cellspacing nil
          :cellpadding nil
          :rules nil
          :frame nil))
;; -------------------------------------------------------
(defun org-html-format-spec (info)
  "Return format specification for preamble and postamble.
INFO is a plist used as a communication channel."
  (let ((timestamp-format (plist-get info :html-metadata-timestamp-format)))
    `((?t . ,(org-export-data (plist-get info :title) info))
      (?s . ,(org-export-data (plist-get info :subtitle) info))
      (?d . ,(org-export-data (org-export-get-date info timestamp-format)
			      info))
      (?T . ,(format-time-string timestamp-format))
      (?a . ,(org-export-data (plist-get info :author) info))
      (?e . ,(mapconcat
	      (lambda (e) (format "<a href=\"mailto:%s\">%s</a>" e e))
	      (split-string (plist-get info :email)  ",+ *")
	      ", "))
      (?c . ,(plist-get info :creator))
      (?C . ,(let ((file (plist-get info :input-file)))
	       (format-time-string timestamp-format
				   (and file (nth 5 (file-attributes file))))))
      (?v . ,(or (plist-get info :html-validation-link) ""))
      (?U . ,(org-export-data (plist-get info :html-link-up) info))
      (?H . ,(org-export-data (plist-get info :html-link-home) info))
      )))
;; -------------------------------------------------------
;; Export UTF-8 checkboxes
(defun sacha/org-html-checkbox (checkbox)
  "Format CHECKBOX into HTML."
  (case checkbox (on "<span class=\"check\">&#x2611;</span>")
        ;; checkbox (checked)
        (off "<span class=\"checkbox\">&#x2610;</span>")
        (trans "<code>[-]</code>")
        (t "")))
(defadvice org-html-checkbox (around sacha activate)
  (setq ad-return-value (sacha/org-html-checkbox (ad-get-arg 0))))
;; -------------------------------------------------------
(provide 'ew-ox-html)
;;; ew-ox-html ends here
