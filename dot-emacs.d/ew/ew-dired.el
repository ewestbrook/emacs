;;; ew-dired -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-dired")
;; -------------------------------------------------------
(defvar dired-auto-revert-buffer t)
(put 'dired-find-alternate-file 'disabled nil)
;; -------------------------------------------------------
(setq-default dired-use-ls-dired 'unspecified)
(setq-default ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)
;; -------------------------------------------------------
;; dired mode hook
(declare-function dired-hide-details-mode "dired")
(defun ew-dired-mode-setup ()
  "EW dired hook stuff."
  (dired-hide-details-mode t))
(add-hook 'dired-mode-hook 'ew-dired-mode-setup)
;; -------------------------------------------------------
;; open files with certain applications
(cond
 ((equal system-type 'gnu/linux)
  (defvar dired-guess-shell-alist-user
    '(("\\.pdf\\'" "okular ? &")
      ("\\.mp4\\'" "mpv ? &")
      ("\\.mkv\\'" "mpv ? &")
      ("\\.avi\\'" "mpv ? &")
      ("\\.flv\\'" "mpv ? &")))))
;; -------------------------------------------------------
(provide 'ew-dired)
;;; ew-dired ends here
