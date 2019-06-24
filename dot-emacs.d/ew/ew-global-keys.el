;;; ew-global-keys --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-global-keys")
;; -------------------------------------------------------
;; keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(global-set-key "\C-xg" 'magit-status)
(global-set-key "\C-x\C-t" 'toggle-truncate-lines)
(global-set-key "\C-x\C-u" 'toggle-current-window-dedication)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>"  ) 'enlarge-window)
(global-set-key (kbd "C-M-g"     ) 'grep)
;; (global-set-key [f7] 'my-compile)
(global-set-key (kbd"<f5>"    ) 'gud-cont)
;; (global-set-key (kbd"<f6>") 'gud-break)
(global-set-key (kbd"<f7>"    ) 'gud-finish)
(global-set-key (kbd"<f8>"    ) 'gud-next)
(global-set-key (kbd"<f9>"    ) 'gud-watch)
(global-set-key (kbd"<f10>"   ) 'gud-step)
(global-set-key (kbd "M-s b"  ) 'ediff-buffers)
(global-set-key (kbd "M-s v"  ) 'ediff-revision)
(global-set-key (kbd "M-p"    ) 'ew-toggle-clipboard-mode)
(global-set-key (kbd "C-+"    ) 'text-scale-increase)
(global-set-key (kbd "C--"    ) 'text-scale-decrease)
(global-set-key (kbd "M-S-SPC") 'set-mark)
(global-set-key (kbd "C-x M-e") 'eval-buffer)
(global-set-key [pause] 'toggle-current-window-dedication)
;; -------------------------------------------------------
;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; -------------------------------------------------------
(provide 'ew-global-keys)
;;; ew-global-keys ends here
