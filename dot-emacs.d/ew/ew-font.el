;;; ew-font --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-font")
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
;; Testing (set-frame-font "Ubuntu Mono")
;; Testing (set-frame-font "Latin Modern Mono Prop")
;; Testing (set-frame-font "Roboto Mono")
;; Testing (set-frame-font "DejaVu Sans Mono")
;; Testing (set-frame-font "Fira Mono")
;; Testing (set-frame-font "Envy Code R")
;; Testing (set-frame-font "Anonmyous Pro")
;; Testing (set-frame-font "Liberation Mono")
;; Testing (set-frame-font "xos4 terminus")
;; Testing (set-frame-font "Terminus (TTF)")
;; Testing (set-frame-font "oxygen mono")
;; Testing (set-frame-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso10646-1")
;; Testing (set-frame-font "Share Tech Mono")
;; Testing (set-frame-font "Ubuntu Mono")
;; Testing (set-frame-font "Cousine")
;; Testing (set-frame-font "Caladea")
;; Testing (set-frame-font "Space Mono")
;; Testing (set-frame-font "Roboto Mono")
;; Testing (set-frame-font "Roboto Mono Light")
;; Testing (set-frame-font "Nimbus Mono L")
;; Testing (set-frame-font "Oxygen Mono")
;; Testing (set-frame-font "Fira Mono")
;; Testing (set-frame-font "Fira Mono Medium")
;; Testing (set-frame-font "Overpass Mono")
;; Testing (set-frame-font "Overpass Mono Semibold")
;; Testing (set-frame-font "Inconsolata")
;; Testing (set-frame-font "PT Mono")
;; Testing (set-frame-font "Nanum Gothic Coding")
;; Testing (set-frame-font "Cutive Mono")
;; Testing (set-frame-font "NanumGothicCoding")
;; Testing (set-frame-font "NovaMono")
;; Testing (set-frame-font "utopia")
;; Testing (set-frame-font "Meera")
;; -------------------------------------------------------
;; Testing (set-frame-font "xos4 terminus 13")
;; Testing (set-frame-font "xos4 terminus 12")
;; Testing (set-frame-font "xos4 terminus 11")
;; Testing (set-frame-font "xos4 terminus 10")
;; Testing (set-frame-font "xos4 terminus 9")
;; -------------------------------------------------------
;; Testing (set-frame-font "terminus 13")
;; Testing (set-frame-font "terminus 12")
;; Testing (set-frame-font "terminus 11")
;; Testing (set-frame-font "terminus 10")
;; Testing (set-frame-font "terminus 9")
;; -------------------------------------------------------
;; Testing (set-frame-font "Iosevka Term Light 13")
;; Testing (set-frame-font "Iosevka Term Light 12")
;; Testing (set-frame-font "Iosevka Term Light 11")
;; Testing (set-frame-font "Iosevka Term Light 10")
;; Testing (set-frame-font "Iosevka Term Light 9")
;; Testing (set-frame-font "Bitstream Vera Sans 13")
;; Testing (set-frame-font "Bitstream Vera Sans Mono 13")
;; Testing (set-frame-font "FantasqueSansMono 13")
;; Testing (set-frame-font "Source Code Pro 13")
;; Testing (set-frame-font "Source Code Pro 11")
;; -------------------------------------------------------
;; Testing (set-frame-font "Menlo 16")
;; Testing (set-frame-font "Menlo 15")
;; Testing (set-frame-font "Menlo 14")
;; Testing (set-frame-font "Menlo 13")
;; Testing (set-frame-font "Menlo 12")
;; Testing (set-frame-font "Menlo 11")
;; Testing (set-frame-font "Menlo 10")
;; Testing (set-frame-font "Menlo 9")
;; -------------------------------------------------------
;; Testing (set-frame-font "Menlo")
;; Testing (set-frame-font "Terminus (TTF)")
;; Testing (set-frame-font "TerminessTTF Nerd Font Mono")
;; -------------------------------------------------------
(setq-default
 ew-host-font-map
 (list
  (cons "^p13[ab]"      "terminus 14")
  (cons "^a1\\."        "Menlo 13")
  (cons "^viking\\."    "terminus 9")
  (cons "^e1\\."        "xos4 terminus 9")
  (cons "^edoras\\."    "xos4 terminus 9")
  (cons "^pn1248518\\." "Menlo 12")
  )
 )
;; -------------------------------------------------------
(defun ew-get-font-by-host-list()
  "Set system font by host name."
  (catch 'found
    (let (sysnam)
      (setq sysnam (system-name))
      (loop for (k . v) in ew-host-font-map do
            (cond
             ((string-match k sysnam)
              (progn
                (message "Host \"%s\" gets font \"%s\"" sysnam v)
                (throw 'found v))))))))
;; -------------------------------------------------------
(defun ew-set-font-and-stuff()
  "Set EW default font, dolors, etc."
  (interactive)
  (if (display-graphic-p)

      (progn

        (setq
         default-frame-alist
         '((cursor-color . "Yellow")
           (mouse-color . "Yellow")
           (foreground-color . "#a6a376")
           (background-color . "#181818")))

        (add-to-list
             'default-frame-alist
             (cons
              'font
              (ew-get-font-by-host-list))))))
;; -------------------------------------------------------
(provide 'ew-font)
;;; ew-font ends here
