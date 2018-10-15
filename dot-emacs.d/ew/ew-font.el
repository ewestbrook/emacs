;;; ew-font --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; check current with (face-attribute 'default :font)
;; get avaialble with (print (font-family-list))
;; set default with (set-frame-font "lucidatypewriter")
;; Testing (set-frame-font "CM Typewriter")
;; Testing (set-frame-font "Luxi Mono")
;; Testing (set-frame-font "Linux Libertine Mono T")
;; Testing (set-frame-font "Linux Libertine Mono O")
;; Testing (set-frame-font "Andale Mono")
;; Testing (set-frame-font "Go Mono")
;; Testing (set-frame-font "PT Mono")
;; Testing (set-frame-font "Droid Sans Mono")
;; Testing (set-frame-font "Noto Mono")
;; Testing (set-frame-font "Noto Mono Light")
;; Testing (set-frame-font "Ubuntu Mono 8")
;; Testing (set-frame-font "Latin Modern Mono Prop")
;; Testing (set-frame-font "Roboto Mono")
;; Testing (set-frame-font "DejaVu Sans Mono")
;; Testing (set-frame-font "Fira Mono")
;; Testing (set-frame-font "Envy Code R 9")
;; Testing (set-frame-font "Anonmyous Pro")
;; Testing (set-frame-font "Liberation Mono")
;; Testing (set-frame-font "xos4 terminus 9")
;; Testing (set-frame-font "oxygen mono")
;; -------------------------------------------------------
(defun ew-set-font-and-stuff()
  "Set EW default font, dolors, etc."
  (interactive)
  (if (display-graphic-p)

      (progn

        (setq
         default-frame-alist
         '((cursor-color . "Red")
           (mouse-color . "Yellow")
           (foreground-color . "#a6a376")
           (background-color . "#181818")))

        (let (sysnam)
          (setq sysnam (system-name))
          (cond

           ((string= sysnam "p13a")
            (add-to-list
             'default-frame-alist
             '(font . "terminus 14")))

           ((or (string= sysnam "edoras") (string= sysnam "e1"))
            (add-to-list
             'default-frame-alist
             '(font . "xos4 terminus 9"))))))))
;; -------------------------------------------------------
(provide 'ew-font)
;;; ew-font ends here
