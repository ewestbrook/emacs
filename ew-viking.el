;;; ew-viking --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-viking")

(require 'ew-font)

(if (and (display-graphic-p) (equal "viking" (system-name)))
    (if (equal (getenv "DISPLAY") ":0.0")
        (progn
          (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
          (add-to-list 'default-frame-alist '(width . 174))
          (add-to-list 'default-frame-alist '(height . 48))
          (add-to-list 'default-frame-alist '(left . 0))
          (add-to-list 'default-frame-alist '(top . 26)))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-viking)
;;; ew-viking.el ends here
