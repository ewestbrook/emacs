;;; ew-path --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-path")

(require 's)

(defun ewp-prependable-paths()
  "Get the list of prepependable paths."
  (let ((home (getenv "HOME")))
    (append
     '("/opt/X11/bin"
       "/usr/local/opt/gnu-sed/libexec/gnubin"
       "/usr/local/opt/texinfo/bin"
       "/Applications/Firefox.app/Contents/MacOS"
       "/Applications/Wireshark.app/Contents/MacOS"
       "/usr/local/texlive/2020/bin/x86_64-darwin"
       "/usr/local/bin"
       "/usr/local/sbin")
     (mapcar (lambda (p) (concat home p))
	     '("/bin"
	       "/git/eew/w/bin")))))

(defun ewp-prepend-paths()
  "Prepend paths in 'ewp-paths' to env's PATH and 'exec-path' uniquely.
For each element that exists as a directory, that is."
  (mapcar 'ewp-prepend-path-dirs (ewp-prependable-paths)))

(defun ewp-prepend-path-dirs(v)
  "Prepend path V to env's PATH and 'exec-path' uniquely.
If V exists as a directory, that is."
  (cond
   ((file-directory-p v)
    (ewp-prepend-path v))))

(defun ewp-prepend-path(v)
  "Prepend path V to env's PATH and 'exec-path' uniquely."
  (ewp-prepend-env-path "PATH" v)
  (ewp-prepend-exec-path v))

(defun ewp-prepend-env-path(e v &optional sep)
  "Prepend V to environment variable E (separated by SEP) uniquely."
  (let* ((s (if sep sep ":"))
        (sv (split-string v s t)))
    (car
     (last
      (mapcar
       (lambda (arg)
         (ewp-prepend-env-path-single e arg sep))
       (split-string v s t))))))

(defun ewp-prepend-env-path-single(e v &optional sep)
  "Prepend V to environment variable E (separated by SEP) uniquely;
V must already be separated by SEP."
  (let ((s (if sep sep ":"))
        (ev (getenv e)))
    (setenv e (if (s-blank? ev) v (s-join s (cons v (delete v (split-string ev s t))))))))

(defun ewp-prepend-exec-path(v)
  "Prepend path V to 'exec-path' uniquely."
  (delete v exec-path)
  (add-to-list 'exec-path v))

(ewp-prepend-paths)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewp-" . "ew-path-"))
;; End:
(provide 'ew-path)
;;; ew-path.el ends here
