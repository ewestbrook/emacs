;;; ew-prettify-symbols-settings --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
;; see
;; https://emacsredux.com/blog/2014/08/25/a-peek-at-emacs-24-dot-4-prettify-symbols-mode/
;; https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
;; https://emacs.stackexchange.com/questions/55059/ligatures-with-the-jetbrains-mono-font
;; -------------------------------------------------------
(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ)))
;; -------------------------------------------------------
(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (push '(">=" . ?≥) prettify-symbols-alist)
   (push '("<=" . ?≤) prettify-symbols-alist)
   ))
;; -------------------------------------------------------
(provide 'ew-prettify-symbols-settings)
;;; ew-prettify-symbols-settings ends here
