;;; ew-lua.el --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(require 'ew-path)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.rockspec\\'" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defun ew-lua-prepend-path(v)
  "Prepend path V to env's LUA_PATH uniquely."
  (ew-path-settings-prepend-env-path "LUA_PATH" v ";"))

(defun ew-lua-prepend-cpath(v)
  "Prepend path V to env's LUA_CPATH uniquely."
  (ew-path-settings-prepend-env-path "LUA_CPATH" v ";"))

(defun ew-lua-add-to-luapath()
  "Construct and prepend strings to LUA_PATH."
  (mapc
   (lambda (p)
     (let ((hp (expand-file-name (concat "~/" p))))
       ;; (message "Adding to LUA_PATH: %s" hp)
       (ew-lua-prepend-path hp)))
	 '("share/lua/5.1/?.lua"
		 "git/eew/w/src/share/lua/5.1/?.lua"
		 "git/eew/w/src/?.lua"
		 "git/ewl/lua/?.lua"
		 "git/vxl/lua/?.lua"
		 "git/aot-ic/l/src/?.lua")))

(defun ew-lua-add-to-luacpath()
  "Construct and prepend strings to LUA_CPATH."
	(mapc
   (lambda (p)
     (let ((hp (expand-file-name (concat "~/" p))))
       ;; (message "Adding to LUA_CPATH: %s" hp)
       (ew-lua-prepend-cpath hp)))
	 '("lib/lua/5.1/?.so"
		 "git/eew/w/src/lib/lua/5.1/?.so"
		 "git/eew/w/src/?.so"
		 "git/ewl/?.so"
		 "git/vxl/?.so"
		 "git/aot-ic/l/src/?.so")))

(defun ew-lua-prepend-paths()
  "Prepend various paths to env's LUA_PATH uniquely.
Do the same with LUA_CPATH.
Retain trailing double semicolons,
or append them if the path was originally empty."

  (let*
      ((lp (getenv "LUA_PATH"))
       (clp (getenv "LUA_CPATH"))

       (lpdef (or (s-blank? lp)
                  (string-match ";;$" lp)))

	     (clpdef (or (s-blank? clp)
                   (string-match ";;$" clp))))

    (ew-lua-add-to-luapath)
    (ew-lua-add-to-luacpath)

    (cond
     (lpdef
      (setenv "LUA_PATH"
              (concat (getenv "LUA_PATH") ";;")))
	   (clpdef
      (setenv "LUA_CPATH"
              (concat (getenv "LUA_CPATH") ";;"))))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-lua)
;;; ew-lua.el ends here
