;;; ew-flx-mode-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; see also
;; https://github.com/lewang/flx
;; https://www.youtube.com/watch?v=d-nxFHYsxN0
;; -------------------------------------------------------
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
;; -------------------------------------------------------
(provide 'ew-flx-mode-settings)
;;; ew-flx-mode-settings ends here
