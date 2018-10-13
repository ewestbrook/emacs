;;; ew-kill --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(defun kill-buffers-of-mode(mode)
  "Kill buffers of mode MODE."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq mode
                    (buffer-local-value
                     'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))
;; -------------------------------------------------------
(defun kill-dired-buffers()
  "Kill buffers of 'dired-mode'."
  (interactive)
  (kill-buffers-of-mode 'dired-mode))
;; -------------------------------------------------------
(defun kill-lua-buffers()
  "Kill buffers of 'lua-mode'."
  (interactive)
  (kill-buffers-of-mode 'lua-mode))
;; -------------------------------------------------------
(defun kill-org-buffers()
  "Kill buffers of 'org-mode'."
  (interactive)
  (kill-buffers-of-mode 'org-mode))
;; -------------------------------------------------------
(defun kill-magit-buffers()
  "Kill buffers of 'magit-mode'."
  (interactive)
  (kill-buffers-of-mode 'magit-mode)
  (kill-buffers-of-mode 'magit-status-mode)
  (kill-buffers-of-mode 'magit-process-mode))
;; -------------------------------------------------------
(provide 'ew-kill)
;;; ew-kill ends here