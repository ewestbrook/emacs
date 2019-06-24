;;; ew-ivy-mode-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-ivy-mode-settings")
;; -------------------------------------------------------
;; ivy-mode
(ivy-mode 1)
(counsel-mode 1)
(setq-default enable-recursive-minibuffers nil)
(setq-default ivy-use-virtual-buffers t)
;; intentional space before end of string
(setq-default ivy-count-format "(%d/%d) ")
(setq-default ivy-initial-inputs-alist nil)
(setq-default ivy-re-builders-alist
              '((t . ivy--regex-fuzzy)))
;; -------------------------------------------------------
(provide 'ew-ivy-mode-settings)
;;; ew-ivy-mode-settings ends here
