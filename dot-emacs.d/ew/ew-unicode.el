;;; ew-unicode --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-unicode")
;; -------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;
;;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)                      
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; -------------------------------------------------------
(provide 'ew-unicode)
;;; ew-unicode ends here
