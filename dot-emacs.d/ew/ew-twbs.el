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
(setq-default
 org-twbs-divs
 '((preamble  "div" "preamble")
   (content   "div" "content") ;; -= "container"
   (postamble "footer" "postamble")))
;; -------------------------------------------------------
;; head
;; 
;; <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Roboto+Mono|Noto+Sans\">
;; <link rel=\"stylesheet\" href=\"c/bootstrap.min.css\">
(setq-default
 org-twbs-head "
<link rel=\"stylesheet\" href=\"c/ewoxtwbs.css\">
<script src=\"j/jquery.min.js\"></script>
")
;; <script src=\"j/bootstrap.min.js\"></script>
;; -------------------------------------------------------
;; home / up
(setq-default org-twbs-home/up-format "")
;; -------------------------------------------------------
;; preamble
(setq-default org-twbs-preamble t)
(setq-default
 org-twbs-preamble-format
 '(("en" "
<ul class=\"ewbar ewtop\">
  <li class=\"ewbara\">
    <a accesskey=\"H\" href=\"%H\"> home </a>
  </li>
  <li class=\"ewbara\">
    <a accesskey=\"h\" href=\"%U\"> up </a>
  </li>
  <li class=\"ewbara\">
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
<ul class=\"ewbar ewbot\">
  <li class=\"ewbara\">
    <a href=\"./index.html\">%a</a>
  </li>
  <li class=\"ewbara\">
    <a href=\"/\">org-mode</a>
  </li>
</ul>
")))
;; -------------------------------------------------------
(provide 'ew-twbs)
;;; ew-twbs ends here
