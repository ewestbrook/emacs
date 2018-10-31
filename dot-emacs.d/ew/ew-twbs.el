;;; ew-twbs -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(setq org-twbs-google-analytics "")
;; -------------------------------------------------------
(setq org-twbs-link-up ".")
(setq org-twbs-link-home "/")
;; -------------------------------------------------------
;; head
(setq
 org-twbs-head
   "
<link rel=\"stylesheet\"
  href=\"https://fonts.googleapis.com/css?family=Roboto+Mono|Noto+Sans\">
<link rel=\"stylesheet\" href=\"/c/bootstrap-min.css\">
<link rel=\"stylesheet\" href=\"/c/ew.css\">
<script src=\"/j/jquery-min.js\"></script>
")
;; <script src=\"/j/bootstrap-min.js\"></script>
;; -------------------------------------------------------
;; home / up
(setq
 org-twbs-home/up-format
   "
<ul class=\"ewtop\">
  <li class=\"ewtopa\">
    <a accesskey=\"h\" href=\"%s\"> up </a>
  </li>
  <li class=\"ewtopa\">
    <a accesskey=\"H\" href=\"%s\"> home </a>
  </li>
  <li class=\"ewtopa ewtopl\">
    <a accesskey=\"H\" href=\"/about.html\"> about </a>
  </li>
</ul>
")
;; -------------------------------------------------------
;; general purpose timestamp format
(setq
 org-twbs-metadata-timestamp-format
 "%F %l:%M:%S %p %Z")
;; -------------------------------------------------------
;; postamble
(setq org-twbs-postamble t)
;; -------------------------------------------------------
;; postamble (footer) format
(setq
 org-twbs-postamble-format
 '(("en" "
<div class=\"ewfoot\">
  <div class=\"ewfootl\">%t</div>
  <div class=\"ewfootr\">%C</div>
</div>
")))
;; -------------------------------------------------------
(provide 'ew-twbs)
;;; ew-twbs ends here
;; -------------------------------------------------------
