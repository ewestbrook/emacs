;; -------------------------------------------------------
;; lua-mode things

(require 'lua-mode)

(setq lua-indent-level 2)
;; (setq lua-indent-level 4)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defadvice magit-ediff (around flymake-off activate)
  (remove-hook 'lua-mode-hook' lua-flymake-hooks)
  ad-do-it
  (add-hook 'lua-mode-hook' lua-flymake-hooks))
;; -------------------------------------------------------
