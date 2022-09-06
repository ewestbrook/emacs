;;; ew-misc --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-misc")

(setq gc-cons-threshold 20000000)
(load "url") (url-handler-mode t)
(tool-bar-mode -1)
(show-paren-mode t)
(line-number-mode 1)
(column-number-mode 1)
(global-font-lock-mode t)
(global-auto-revert-mode 1)
(put 'downcase-region 'disabled nil)
(setq-default buffers-menu-max-size nil)
(setq-default default-major-mode 'text-mode)
(setq-default exec-path (append exec-path '("/usr/local/texlive/2018/bin")))
(setq-default font-lock-maximum-decoration t)
(setq-default inhibit-splash-screen t)
(setq-default large-file-warning-threshold 50000000)
(setq-default lpr-command "xpp")
(setq-default make-backup-files nil)
(setq-default mouse-buffer-menu-mode-mult 0)
(setq-default next-line-add-newlines nil)
(setq-default ps-lpr-command "xpp")
(setq-default require-final-newline t)
(setq-default scroll-step 1)
(setq-default transient-mark-mode t)
(setq-default uniquify-buffer-name-style 'post-forward)
(setq-default user-mail-address "")
(setq-default user-full-name "")
(add-to-list 'auto-mode-alist '("/db\\." . dns-mode))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-misc)
;;; ew-misc.el ends here
