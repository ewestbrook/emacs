;;; ew-dired -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(use-package dired

  :ensure nil

  :preface
  (defun ew-dired-mode-setup ()
    "EW Dired hook stuff."
    (dired-hide-details-mode t))

  :hook (dired-mode . ew-dired-mode-setup)

  :config
  (setq dired-auto-revert-buffer t)
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-use-ls-dired 'unspecified)
  (setq ls-lisp-use-insert-directory-program nil)
  (declare-function dired-hide-details-mode "dired")

  ;; open files with certain applications
  (cond
   ((equal system-type 'gnu/linux)
    (setq dired-guess-shell-alist-user
      '(("\\.pdf\\'" "okular ? &")
        ("\\.mp4\\'" "mpv ? &")
        ("\\.mkv\\'" "mpv ? &")
        ("\\.avi\\'" "mpv ? &")
        ("\\.flv\\'" "mpv ? &"))))))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-dired)
;;; ew-dired.el ends here
