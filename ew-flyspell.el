;;; ew-flyspell -- Summary
;;; Commentary:
;;; Code:

;; (ew-maybe-flyspell-mode)

(message "ew-flyspell.el")

(use-package flyspell

  :preface
  (defvar ew-no-flyspell-modes '(yaml-mode emacs-lisp-mode))

  (defun ew-flyspell-mode ()
    (flyspell-mode 1))

  (defun ew-flyspell-prog ()
    (turn-off-flyspell)
    (flyspell-prog-mode))

  (defun ew-maybe-not-flyspell-mode (target-mode my-modes fsmodefn)
    (if (member target-mode my-modes)
        (if (member major-mode ew-no-flyspell-modes)
            (progn
              (message "Disabling flyspell-mode for %s buffer %s" major-mode (buffer-name))
              (turn-off-flyspell)
              t)
          (message "Enabling %s for %s buffer %s" fsmodefn major-mode (buffer-name))
          (funcall fsmodefn)
          t)
      nil))

  (defun ew-maybe-flyspell-mode ()
    (let ((my-modes (ew-mode-parents major-mode)))
      (unless (ew-maybe-not-flyspell-mode 'prog-mode my-modes 'ew-flyspell-prog)
        (ew-maybe-not-flyspell-mode 'text-mode my-modes 'ew-flyspell-mode))))

  :hook
  (find-file-hook . ew-maybe-flyspell-mode)

  :config
  (setq ispell-program-name "/usr/bin/aspell"))


;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-flyspell)
;;; ew-flyspell.el ends here
