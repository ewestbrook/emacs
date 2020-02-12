;;; ew-helm-settings --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-helm-settings")
;; -------------------------------------------------------
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(setq-default helm-allow-mouse t)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(setq-default
 helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
 helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
 helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
 helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
 helm-ff-file-name-history-use-recentf t
 helm-echo-input-in-header-line        t)
(helm-mode 1)
;; -------------------------------------------------------
(provide 'ew-helm-settings)
;;; ew-helm-settings ends here
