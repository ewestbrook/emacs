;;; ew-ediff -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-ediff.el")

(use-package ediff

  :preface
  (defun ew-ediff-mode-init()
    "Init ediff mode."
    (if (display-graphic-p)
        (progn
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
          (set-face-attribute 'ediff-even-diff-C    nil :background "#383830"))
      (progn
          (set-face-attribute 'ediff-current-diff-A nil :background "#442222")
          (set-face-attribute 'ediff-fine-diff-A    nil :background "#603a3a")
          (set-face-attribute 'ediff-odd-diff-A     nil :background "#110000")
          (set-face-attribute 'ediff-even-diff-A    nil :background "#220808")

          (set-face-attribute 'ediff-current-diff-B nil :background "#224422")
          (set-face-attribute 'ediff-fine-diff-B    nil :background "#3a603a")
          (set-face-attribute 'ediff-odd-diff-B     nil :background "#001100")
          (set-face-attribute 'ediff-even-diff-B    nil :background "#082208")

          (set-face-attribute 'ediff-current-diff-C nil :background "#444422")
          (set-face-attribute 'ediff-fine-diff-C    nil :background "#60603a")
          (set-face-attribute 'ediff-odd-diff-C     nil :background "#111100")
          (set-face-attribute 'ediff-even-diff-C    nil :background "#222208"))
      ))

  :hook (ediff-mode . ew-ediff-mode-init)

  :bind (("M-s b" . 'ediff-buffers)
         ("M-s v" . 'ediff-revision))

  :config
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-diff-options "-w"))

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
