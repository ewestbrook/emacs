;;; ew-font --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; check current with (face-attribute 'default :font)
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
             '(font . "terminus 9"))))))))
;; -------------------------------------------------------
(provide 'ew-font)
;;; ew-font ends here
