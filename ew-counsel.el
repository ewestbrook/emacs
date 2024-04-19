;;; ew-counsel -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-counsel.el")

(use-package counsel
  :bind (("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("M-y"     . counsel-yank-pop)
         ("<f1> f"  . counsel-describe-function)
         ("<f1> v"  . counsel-describe-variable)
         ("<f1> l"  . counsel-find-library)
         ("<f2> i"  . counsel-info-lookup-symbol)
         ("<f2> u"  . counsel-unicode-char)
         ("<f2> j"  . counsel-set-variable)
         ("C-c c"   . counsel-compile)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c L"   . counsel-git-log)
         ("C-c k"   . counsel-rg)
         ("C-c m"   . counsel-linux-app)
         ;; ("C-c n"   . counsel-fzf)
         ;; ("C-x l"   . counsel-locate)
         ("C-c J"   . counsel-file-jump)
         ;; ("C-S-o"   . counsel-rhythmbox)
         ;; ("C-c w"   . counsel-wmctrl)
         ("C-c b"   . counsel-bookmark)
         ("C-c d"   . counsel-descbinds)
         ("C-c o"   . counsel-outline)
         ("C-c t"   . counsel-load-theme)
         ("C-c F"   . counsel-org-file)))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-counsel)
;;; ew-counsel.el ends here
