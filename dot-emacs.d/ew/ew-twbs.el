;;; ew-twbs -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; scripts overrides
(setq-default org-twbs-google-analytics "")
(setq-default org-twbs-scripts "")
;; -------------------------------------------------------
(setq-default org-twbs-link-up ".")
(setq-default org-twbs-link-home "/")
(setq-default org-twbs-with-latex 'dvipng)
;; -------------------------------------------------------
;; head
;; 
;; <script src=\"/j/jquery-min.js\"></script>
;; <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Roboto+Mono|Noto+Sans\">
(setq-default
 org-twbs-head "
<link rel=\"stylesheet\" href=\"/c/bootstrap-min.css\">
<link rel=\"stylesheet\" href=\"/c/ewoxtwbs.css\">
")
;; <script src=\"/j/bootstrap-min.js\"></script>
;; -------------------------------------------------------
;; home / up
(setq-default org-twbs-home/up-format "")
;; -------------------------------------------------------
;; preamble
(setq-default org-twbs-preamble t)
(setq-default
 org-twbs-preamble-format
 '(("en" "
<ul class=\"ewtop\">
  <li class=\"ewtopa\">
    <a accesskey=\"H\" href=\"%H\"> home </a>
  </li>
  <li class=\"ewtopa\">
    <a accesskey=\"h\" href=\"%U\"> up </a>
  </li>
  <li class=\"ewtopa\">
    <a href=\"#title\">%t</a>
  </li>
</ul>
")))
;; -------------------------------------------------------
;; general purpose timestamp format
(setq-default
 org-twbs-metadata-timestamp-format
 "%F %l:%M %p %Z")
;; -------------------------------------------------------
;; postamble
(setq-default org-twbs-postamble t)
(setq-default
 org-twbs-postamble-format
 '(("en" "
<div class=\"ewfoot\">
  <div class=\"ewfootl\">Eric Westbrook</div>
  <div class=\"ewfootr\">%C</div>
</div>
")))
;; -------------------------------------------------------
(provide 'ew-twbs)
;;; ew-twbs ends here
