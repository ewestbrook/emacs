;;; ew-flx -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-flx")

;; see also
;; https://github.com/lewang/flx
;; https://www.youtube.com/watch?v=d-nxFHYsxN0

(require 'flx-ido)
(ido-mode 1)
;; (ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewf-" . "ew-flx-"))
;; End:
(provide 'ew-flx)
;;; ew-flx.el ends here
