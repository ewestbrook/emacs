(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-diff-options "-w")

;; https://oremacs.com/2015/01/17/setting-up-ediff/
;; for saving and restoring window configuration
;; ediff-before-setup-hook
;; ediff-quit-hook
;; ediff-suspend-hook

;; suggestions:
;;
;; (setq-default ediff-highlight-all-diffs nil)
;; (setq ediff-highlight-all-diffs 't)
;; (setq ediff-diff-options "-w") ; -w = disable whitespace
;; (setq-default ediff-ignore-similar-regions t)
;; (setq-default ediff-highlight-all-diffs nil)
