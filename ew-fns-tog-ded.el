;;; ew-fns-tog-ded --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-fns-tog-ded.el")

;; tog-ded
(defun ew-toggle-current-window-dedication ()
  "Toggle dedication of curent window."
  (interactive)
  (let* ((window (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))

(global-set-key "\C-x\C-u" 'ew-toggle-current-window-dedication)
(global-set-key [pause]    'ew-toggle-current-window-dedication)

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-fns-tog-ded)
;;; ew-fns-tog-ded.el ends here
