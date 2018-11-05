;;; ew-lua-mode.el --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(require 'lua-mode)
;; -------------------------------------------------------
(setq-default lua-indent-level 2)
;; (setq-default lua-indent-level 2)
;; (setq-default lua-indent-level 4)
;; -------------------------------------------------------
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; -------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;; -------------------------------------------------------
(provide 'ew-lua-mode)
;;; ew-lua-mode ends here
