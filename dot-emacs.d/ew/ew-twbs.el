;;; ew-twbs -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(setq org-twbs-google-analytics "")
;; -------------------------------------------------------
;; head
(custom-set-variables
 '(org-twbs-head
   "<link rel=\"stylesheet\" href=\"/c/bootstrap-min.css\">

<script src=\"https://westbrook.today/j/jquery-min.js\"></script>

<script src=\"https://westbrook.today/j/bootstrap-min.js\"></script>"))
;; -------------------------------------------------------
;; home / up
(custom-set-variables
 '(org-twbs-home/up-format
   "<div id=\"org-div-home-and-up\">
<a accesskey=\"h\" href=\"%s\"> up </a>
|
<a accesskey=\"H\" href=\"%s\"> home </a>
</div>"))
;; -------------------------------------------------------
;; general purpose timestamp format
(custom-set-variables
 '(org-twbs-metadata-timestamp-format
   "%F %l:%M:%S %p %Z"))
;; -------------------------------------------------------
;; postamble
(custom-set-variables
 '(org-twbs-postamble
   t))
;; -------------------------------------------------------
;; postamble (footer) format
(custom-set-variables
 '(org-twbs-postamble-format
   (quote
    (("en" "
<div style=\"display:flex;\">
  <div style=\"flex: 1; text-align: left;\">%t</div>
  <div style=\"flex: 1; text-align: right;\">%C</div>
</div>
")))))
;; -------------------------------------------------------
(provide 'ew-twbs)
;;; ew-twbs ends here
;; -------------------------------------------------------
