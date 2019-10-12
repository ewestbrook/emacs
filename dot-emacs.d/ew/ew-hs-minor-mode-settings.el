;;; ew-hs-minor-mode-settings -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-hs-minor-mode-settings")
;; -------------------------------------------------------
;; reference URL: https://stackoverflow.com/a/17775868
;; -------------------------------------------------------
;; (define-globalized-minor-mode global-hs-minor-mode hs-minor-mode hs-minor-mode)
;; (global-hs-minor-mode 1)
;; (define-key hs-minor-mode-map (kbd "C-c TAB") 'hs-toggle-hiding)
;; -------------------------------------------------------
(defun hs-minor-mode-on()
  (interactive)
  (hs-minor-mode 1)
  (define-key hs-minor-mode-map (kbd "C-c TAB") 'hs-toggle-hiding))
;; -------------------------------------------------------
;; https://emacs.stackexchange.com/a/5364
(add-hook 'python-mode-hook 'hs-minor-mode-on)
;; -------------------------------------------------------
(provide 'ew-hs-minor-mode-settings)
;;; ew-hs-minor-mode-settings ends here
