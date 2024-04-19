;;; ew-org-bullets -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-org-bullets.el")

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (setq org-bullets-bullet-list
        '("✸" "▶" "◆" "◉" "►" "" "•" "⋅"))
  ;; more dots: 🔯 💠 ⸳ ⸱ ⸭ ⟐ ⋅ ⊡ ⊙ ⁛ ·
  )

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-org-bullets)
;;; ew-org-bullets.el ends here
