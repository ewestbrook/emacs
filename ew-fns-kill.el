;;; ew-fns-kill --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-kill.el")

(defun ew-kill-buffers-of-mode(mode)
  "Kill buffers of mode MODE."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq mode
                    (buffer-local-value
                     'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(defun ew-kill-dired-buffers()
  "Kill buffers of 'dired-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'dired-mode))

(defun ew-kill-lua-buffers()
  "Kill buffers of 'lua-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'lua-mode))

(defun ew-kill-org-buffers()
  "Kill buffers of 'org-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'org-mode))

(defun ew-kill-css-buffers()
  "Kill buffers of 'css-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'css-mode))

(defun ew-kill-eww-buffers()
  "Kill buffers of 'eww-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'eww-mode))

(defun ew-kill-c-buffers()
  "Kill buffers of 'c-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'c-mode))

(defun ew-kill-yaml-buffers()
  "Kill buffers of 'yaml-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'yaml-mode))

(defun ew-kill-java-buffers()
  "Kill buffers of 'java-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'java-mode))

(defun ew-kill-magit-buffers()
  "Kill buffers of 'magit-mode'."
  (interactive)
  (ew-kill-buffers-of-mode 'magit-mode)
  (ew-kill-buffers-of-mode 'magit-status-mode)
  (ew-kill-buffers-of-mode 'magit-process-mode))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-kill)
;;; ew-fns-kill.el ends here
