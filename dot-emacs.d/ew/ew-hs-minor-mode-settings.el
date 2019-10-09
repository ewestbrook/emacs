;;; ew-hs-minor-mode-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-hs-minor-mode-settings")
;; -------------------------------------------------------
(define-key hs-minor-mode-map (kbd "C-c TAB") 'hs-toggle-hiding)
;; -------------------------------------------------------
(defun hs-minor-mode-on()
  (interactive)
  (hs-minor-mode 1))
;; -------------------------------------------------------
;; https://emacs.stackexchange.com/a/5364
(add-hook 'python-mode-hook 'hs-minor-mode-on)
;; -------------------------------------------------------
(provide 'ew-hs-minor-mode-settings)
;;; ew-hs-minor-mode-settings ends here
