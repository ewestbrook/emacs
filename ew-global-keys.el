;;; ew-global-keys --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-global-keys.el")

;; misc
(global-set-key (kbd "M-S-SPC") 'set-mark)
(global-set-key (kbd "C-x M-e") 'eval-buffer)
(global-set-key (kbd "C-x M-u") 'revert-buffer)

;; viking hack for magit+tramp
;; (defun ew-viking-tramp-remote-path()
;;   "Hack to help magit+tramp use the right path to git."
;;   (interactive)
;;   (push "/export/home/eric/bin" tramp-remote-path))
;; (global-set-key (kbd "C-M-?") 'ew-viking-tramp-remote-path)

;; ew
(global-set-key "\C-x\C-t"  'toggle-truncate-lines)
(global-set-key (kbd "M-p") 'ew-toggle-clipboard-mode)
(global-set-key "\C-cd"     'remove-dos-eol)
(global-set-key "\C-xL"     'display-line-numbers-mode)

;; embiggen/enshrinken
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; grep
(global-set-key (kbd "C-M-g") 'grep)

;; smex
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-global-keys)
;;; ew-global-keys.el ends here
