;;; ew-ediff -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-ediff")

(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default ediff-diff-options "-w")

(if (display-graphic-p)
    (add-hook
     'ediff-mode-hook
     (lambda ()

       (set-face-attribute 'ediff-current-diff-A nil :background "#402020")
       (set-face-attribute 'ediff-fine-diff-A    nil :background "#582020")
       (set-face-attribute 'ediff-odd-diff-A     nil :background "#303030")
       (set-face-attribute 'ediff-even-diff-A    nil :background "#383030")

       (set-face-attribute 'ediff-current-diff-B nil :background "#204020")
       (set-face-attribute 'ediff-fine-diff-B    nil :background "#205820")
       (set-face-attribute 'ediff-odd-diff-B     nil :background "#303030")
       (set-face-attribute 'ediff-even-diff-B    nil :background "#303830")

       (set-face-attribute 'ediff-current-diff-C nil :background "#404000")
       (set-face-attribute 'ediff-fine-diff-C    nil :background "#505010")
       (set-face-attribute 'ediff-odd-diff-C     nil :background "#303030")
       (set-face-attribute 'ediff-even-diff-C    nil :background "#383830"))))

;; https://oremacs.com/2015/01/17/setting-up-ediff/
;; for saving and restoring window configuration
;; ediff-before-setup-hook
;; ediff-quit-hook
;; ediff-suspend-hook

;; suggestions:
;;
;; (setq-default ediff-highlight-all-diffs nil)
;; (setq-default ediff-highlight-all-diffs 't)
;; (setq-default ediff-diff-options "-w") ; -w = disable whitespace
;; (setq-default ediff-ignore-similar-regions t)
;; (setq-default ediff-highlight-all-diffs nil)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-ediff)
;;; ew-ediff.el ends here
