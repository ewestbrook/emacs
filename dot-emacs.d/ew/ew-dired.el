;;; ew-dired -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-dired")
;; -------------------------------------------------------
(defvar dired-auto-revert-buffer t)
;; -------------------------------------------------------
;; dired mode hook
(declare-function dired-hide-details-mode "dired")
(defun ew-dired-mode-setup ()
  "EW dired hook stuff."
  (dired-hide-details-mode t)
  ;; (auto-revert-mode)
  ;; (local-set-key (kbd "C-x g") 'magit-status)
  )
(add-hook 'dired-mode-hook 'ew-dired-mode-setup)
;; -------------------------------------------------------
;; open files with certain applications
(defvar dired-guess-shell-alist-user
      '(
        ("\\.pdf\\'" "okular ? &")
        ("\\.mp4\\'" "mpv ? &")
        ("\\.mkv\\'" "mpv ? &")
        ("\\.avi\\'" "mpv ? &")
        ("\\.flv\\'" "mpv ? &")
        )
      )
;; -------------------------------------------------------
(provide 'ew-dired)
;;; ew-dired ends here
