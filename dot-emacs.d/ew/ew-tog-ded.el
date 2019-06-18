;;; ew-tog-ded --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-tog-ded")
;; -------------------------------------------------------
;; tog-ded
(defun toggle-current-window-dedication ()
  (interactive)
  (let* ((window (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))
;; -------------------------------------------------------
(provide 'ew-tog-ded)
;;; ew-tog-ded ends here
