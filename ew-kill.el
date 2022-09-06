;;; ew-kill --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-kill")

(defun ewk-buffers-of-mode(mode)
  "Kill buffers of mode MODE."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq mode
                    (buffer-local-value
                     'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(defun ewk-dired-buffers()
  "Kill buffers of 'dired-mode'."
  (interactive)
  (ewk-buffers-of-mode 'dired-mode))

(defun ewk-lua-buffers()
  "Kill buffers of 'lua-mode'."
  (interactive)
  (ewk-buffers-of-mode 'lua-mode))

(defun ewk-org-buffers()
  "Kill buffers of 'org-mode'."
  (interactive)
  (ewk-buffers-of-mode 'org-mode))

(defun ewk-css-buffers()
  "Kill buffers of 'css-mode'."
  (interactive)
  (ewk-buffers-of-mode 'css-mode))

(defun ewk-eww-buffers()
  "Kill buffers of 'eww-mode'."
  (interactive)
  (ewk-buffers-of-mode 'eww-mode))

(defun ewk-c-buffers()
  "Kill buffers of 'c-mode'."
  (interactive)
  (ewk-buffers-of-mode 'c-mode))

(defun ewk-magit-buffers()
  "Kill buffers of 'magit-mode'."
  (interactive)
  (ewk-buffers-of-mode 'magit-mode)
  (ewk-buffers-of-mode 'magit-status-mode)
  (ewk-buffers-of-mode 'magit-process-mode))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewk-" . "ew-kill-"))
;; End:
(provide 'ew-kill)
;;; ew-kill.el ends here
