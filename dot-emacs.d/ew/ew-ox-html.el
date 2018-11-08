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
<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Roboto+Mono|Noto+Sans\">
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
(defun org-html-template-pre-html (contents info)
  "The pre-html part."
   (when (and (not (org-html-html5-p info)) (org-html-xhtml-p info))
     (let* ((xml-declaration (plist-get info :html-xml-declaration))
	    (decl (or (and (stringp xml-declaration) xml-declaration)
		      (cdr (assoc (plist-get info :html-extension)
				  xml-declaration))
		      (cdr (assoc "html" xml-declaration))
		      "")))
       (when (not (or (not decl) (string= "" decl)))
	 (format "%s\n"
		 (format decl
			 (or (and org-html-coding-system
				  (fboundp 'coding-system-get)
				  (coding-system-get org-html-coding-system 'mime-charset))
			     "iso-8859-1")))))))
;; -------------------------------------------------------
(defun org-html-template-html-open (contents info)
  "The opening html tag."
   (concat "<html"
	   (cond ((org-html-xhtml-p info)
		  (format
		   " xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"%s\" xml:lang=\"%s\""
		   (plist-get info :language) (plist-get info :language)))
		 ((org-html-html5-p info)
		  (format " lang=\"%s\"" (plist-get info :language))))
	   ">\n"))
;; -------------------------------------------------------
(defun org-html-template-uphome-body (contents info)
  "The up/home body section."
   (let ((link-up (org-trim (plist-get info :html-link-up)))
	 (link-home (org-trim (plist-get info :html-link-home))))
     (unless (and (string= link-up "") (string= link-home ""))
       (format (plist-get info :html-home/up-format)
	       (or link-up link-home)
	       (or link-home link-up)))))
;; -------------------------------------------------------
(defun org-html-template-document-title (contents info)
  "The document title body section."
   (when (plist-get info :with-title)
     (let ((title (and (plist-get info :with-title)
		       (plist-get info :title)))
	   (subtitle (plist-get info :subtitle))
	   (html5-fancy (org-html--html5-fancy-p info)))
       (when title
	 (format
	  (if html5-fancy
	      "<header>\n<h1 class=\"title\">%s</h1>\n%s</header>"
	    "<h1 class=\"title\">%s%s</h1>\n")
	  (org-export-data title info)
	  (if subtitle
	      (format
	       (if html5-fancy
		   "<p class=\"subtitle\">%s</p>\n"
		 (concat "\n" (org-html-close-tag "br" nil info) "\n"
			 "<span class=\"subtitle\">%s</span>\n"))
	       (org-export-data subtitle info))
	    ""))))))
;; -------------------------------------------------------
(defun org-html-template-maybe-klipse (contents info)
  "The klipse body section, if appropriate."
   (if (plist-get info :html-klipsify-src)
       (concat "<script>" (plist-get info :html-klipse-selection-script)
	       "</script><script src=\""
	       org-html-klipse-js
	       "\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\""
	       org-html-klipse-css "\"/>")))
;; -------------------------------------------------------
(defun org-html-template (contents info)
  "Return complete document string after HTML conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options."
  (concat
   (org-html-template-pre-html contents info)
   (org-html-doctype info)
   "\n"
   (org-html-template-html-open contents info)
   "<head>\n"
   (org-html--build-meta-info info)
   (org-html--build-head info)
   (org-html--build-mathjax-config info)
   "</head>\n"
   "<body>\n"
   (org-html-template-uphome-body contents info)
   ;; Preamble.
   (org-html--build-pre/postamble 'preamble info)
   ;; Document contents.
   (let ((div (assq 'content (plist-get info :html-divs))))
     (format "<%s id=\"%s\">\n" (nth 1 div) (nth 2 div)))
   ;; Document title.
   (org-html-template-document-title contents info)
   ;; "contents" is already toc plus contents
   ;; "<div class=\"tocpluscontents\">"
   contents
   ;; "</div>"
   (format "</%s>\n" (nth 1 (assq 'content (plist-get info :html-divs))))
   ;; Postamble.
   (org-html--build-pre/postamble 'postamble info)
   ;; Possibly use the Klipse library live code blocks.
   (org-html-template-maybe-klipse contents info)
   ;; Closing document.
   "</body>\n</html>"))
;; -------------------------------------------------------
(defun org-html-inner-template (contents info)
  "Return body of document string after HTML conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options."
  (concat
   ;; Table of contents.
   (let ((depth (plist-get info :with-toc)))
     (when depth (org-html-toc depth info)))
   ;; Document contents.
   "<div class=\"innertemplate\">"
   contents
   "</div>"
   ;; Footnotes section.
   (org-html-footnote-section info)))
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
