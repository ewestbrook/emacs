;;; ew-luapaths --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-luapaths")
;; -------------------------------------------------------
(require 'ew-pathenv)
;; -------------------------------------------------------
(setq-default
 ew-luapaths-lua-paths
 (list
  (concat (getenv "HOME") "/share/lua/5.1/?.lua")
  (concat (getenv "HOME") "/git/eew/w/src/share/lua/5.1/?.lua")
  (concat (getenv "HOME") "/git/eew/w/src/?.lua")
  (concat (getenv "HOME") "/git/ewl/lua/?.lua")
  (concat (getenv "HOME") "/git/vxl/lua/?.lua")
  (concat (getenv "HOME") "/git/aot-ic/l/src/?.lua")))
;; -------------------------------------------------------
(setq-default
 ew-luapaths-lua-cpaths
 (list
  (concat (getenv "HOME") "/lib/lua/5.1/?.so")
  (concat (getenv "HOME") "/git/eew/w/src/lib/lua/5.1/?.so")
  (concat (getenv "HOME") "/git/eew/w/src/?.so")
  (concat (getenv "HOME") "/git/ewl/?.so")
  (concat (getenv "HOME") "/git/vxl/?.so")
  (concat (getenv "HOME") "/git/aot-ic/l/src/?.so")))
;; -------------------------------------------------------
(defun ew-luapaths-prepend-paths()
  "Prepend paths in 'ew-pathenv-lua-paths' to env's LUA_PATH uniquely, and similarly with ew-pathenv-clua-paths and LUA_CPATH, retaining trailing semicolons or adding them if the path was originally empty."
  (let* ((lp (getenv "LUA_PATH"))
         (clp (getenv "LUA_CPATH"))
         (lpdef (or (s-blank? lp)
                    (string-match ";;$" lp)))
         (clpdef (or (s-blank? clp)
                     (string-match ";;$" clp))))
    (mapcar 'ew-luapaths-prepend-path
            ew-luapaths-lua-paths)
    (mapcar 'ew-luapaths-prepend-cpath
            ew-luapaths-lua-cpaths)
    (cond (lpdef
           (setenv "LUA_PATH"
                   (concat (getenv "LUA_PATH") ";;"))))
    (cond (clpdef
           (setenv "LUA_CPATH"
                   (concat (getenv "LUA_CPATH") ";;"))))))
;; -------------------------------------------------------
(defun ew-luapaths-prepend-path(v)
  "Prepend path V to env's LUA_PATH uniquely."
  (ew-pathenv-prepend-env-path "LUA_PATH" v ";"))
;; -------------------------------------------------------
(defun ew-luapaths-prepend-cpath(v)
  "Prepend path V to env's LUA_CPATH uniquely."
  (ew-pathenv-prepend-env-path "LUA_CPATH" v ";"))
;; -------------------------------------------------------
(provide 'ew-luapaths)
;;; ew-luapaths ends here
