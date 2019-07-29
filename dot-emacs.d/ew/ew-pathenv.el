;;; ew-pathenv --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-pathenv")
;; -------------------------------------------------------
(require 's)
;; -------------------------------------------------------
(setq-default ew-pathenv-home (getenv "HOME"))
;; -------------------------------------------------------
(setq-default
 ew-pathenv-paths
 (append
  '("/usr/local/opt/gnu-sed/libexec/gnubin"
    "/usr/local/opt/texinfo/bin"
    "/Applications/Firefox.app/Contents/MacOS"
    "/usr/local/bin"
    "/usr/local/sbin")
  (list (concat ew-pathenv-home "/bin"))
  (list (concat ew-pathenv-home "/git/w/bin"))))
;; -------------------------------------------------------
(defun ew-pathenv-prepend-paths()
  "Prepend paths in 'ew-pathenv-paths' to env's PATH and 'exec-path' uniquely, for each element that exists as a directory."
  (mapcar 'ew-pathenv-prepend-path-dirs ew-pathenv-paths))
;; -------------------------------------------------------
(defun ew-pathenv-prepend-path-dirs(v)
  "Prepend path V to env's PATH and 'exec-path' uniquely, if V exists as a directory."
  (cond
   ((file-directory-p v)
    (ew-pathenv-prepend-path v))))
;; -------------------------------------------------------
(defun ew-pathenv-prepend-path(v)
  "Prepend path V to env's PATH and 'exec-path' uniquely."
  (ew-pathenv-prepend-env-path "PATH" v)
  (ew-pathenv-prepend-exec-path v))
;; -------------------------------------------------------
(defun ew-pathenv-prepend-env-path(e v &optional sep)
  "Prepend V to environment variable E (separated by SEP) uniquely."
  (let* ((s (if sep sep ":"))
        (sv (split-string v s t)))
    (car
     (last
      (mapcar
       (lambda(arg)
         (ew-pathenv-prepend-env-path-single e arg sep))
       (split-string v s t))))))
;; -------------------------------------------------------
(defun ew-pathenv-prepend-env-path-single(e v &optional sep)
  "Prepend V to environment variable E (separated by SEP) uniquely; V must already be separated by SEP."
  (let ((s (if sep sep ":"))
        (ev (getenv e)))
    (setenv e (if (s-blank? ev) v (s-join s (cons v (delete v (split-string ev s t))))))))
;; -------------------------------------------------------
(defun ew-pathenv-prepend-exec-path(v)
  "Prepend path V to 'exec-path' uniquely."
  (delete v exec-path)
  (add-to-list 'exec-path v))
;; -------------------------------------------------------
(provide 'ew-pathenv)
;;; ew-pathenv ends here
