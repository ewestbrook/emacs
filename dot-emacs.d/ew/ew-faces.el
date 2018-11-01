;;; ew-faces -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(defvar ew-prop-faces
  '(org-default
    org-level-1
    org-level-2
    org-level-3
    org-level-4
    org-level-5
    org-level-6
    org-level-7
    org-level-8))
;; -------------------------------------------------------
(defvar ew-mono-faces
      '(org-block-begin-line
        org-meta-line
        org-code))
;; -------------------------------------------------------
(defvar ew-nevermind-faces '(org-link org-verbatim))
;; -------------------------------------------------------
(defun ewtf (k v face)
  "Give attribute K the value V in FACE."
  (set-face-attribute face nil k v))
;; -------------------------------------------------------
(defun ewtfs (k v faces)
  "Give attribute K the value V in FACES."
  (while faces
    (ewtf k v (car faces))
    (setq faces (cdr faces))))
;; -------------------------------------------------------
(defun ew-org-mode-face-tweaks()
  "EW 'org-mode' face tweaks."
  ;; ----------------------
  (ewtfs :family "Noto Sans"   ew-prop-faces)
  (ewtfs :family "Noto Sans Mono" ew-mono-faces)
  ;; ----------------------
  (ewtf :height 1.5 'org-level-1)
  (ewtf :height 1.3 'org-level-2)
  (ewtf :height 1.2 'org-level-3)
  (ewtf :height 0.8 'org-block-begin-line))
  ;; ----------------------
(add-hook 'org-mode-hook 'ew-org-mode-face-tweaks)
;; -------------------------------------------------------
(defun ew-ediff-mode-face-tweaks()
  "EW 'ediff-mode' face tweaks."
  ;; ----------------------
  (ewtf :background "#402020" 'ediff-current-diff-A)
  (ewtf :background "#582020" 'ediff-fine-diff-A)
  (ewtf :background "#303030" 'ediff-odd-diff-A)
  (ewtf :background "#383030" 'ediff-even-diff-A)
  ;; ----------------------
  (ewtf :background "#204020" 'ediff-current-diff-B)
  (ewtf :background "#205820" 'ediff-fine-diff-B)
  (ewtf :background "#303030" 'ediff-odd-diff-B)
  (ewtf :background "#303830" 'ediff-even-diff-B)
  ;; ----------------------
  (ewtf :background "#404000" 'ediff-current-diff-C)
  (ewtf :background "#505010" 'ediff-fine-diff-C)
  (ewtf :background "#303030" 'ediff-odd-diff-C)
  (ewtf :background "#383830" 'ediff-even-diff-C))
  ;; ----------------------
(add-hook 'ediff-mode-hook 'ew-ediff-mode-face-tweaks)
;; -------------------------------------------------------
(defun ew-magit-mode-face-tweaks()
  "EW 'magit-mode' face tweaks."
  ;; ----------------------
  (ewtf :family "Noto Sans" 'magit-section-heading)
  (ewtf :height 1.6 'magit-section-heading)
  ;; ----------------------
  (ewtf :background "#242424" 'magit-diff-context)
  ;; ----------------------
  (ewtf :background "#204020" 'magit-diff-added)
  (ewtf :foreground "#cccccc" 'magit-diff-added)
  ;; ----------------------
  (ewtf :background "#402020" 'magit-diff-removed)
  (ewtf :foreground "#cccccc" 'magit-diff-removed)
  ;; ----------------------
  (ewtf :background "#3a3a3a" 'magit-diff-context-highlight)
  (ewtf :background "#482020" 'magit-diff-removed-highlight)
  (ewtf :background "#204820" 'magit-diff-added-highlight))
  ;; ----------------------
(add-hook 'magit-status-mode-hook 'ew-magit-mode-face-tweaks)
;; -------------------------------------------------------
(defun ew-company-face-tweaks()
  "EW 'company-mode' face tweaks."
  (ewtf :background "#282828" 'company-tooltip)
  (ewtf :foreground "#dd00dd" 'company-tooltip)
  (ewtf :background "#282828" 'company-tooltip-selection)
  (ewtf :foreground "#dddd00" 'company-tooltip-selection)
  (ewtf :background "#404040" 'company-scrollbar-bg))
;; (add-hook 'web-mode-hook 'ew-company-face-tweaks)
;; -------------------------------------------------------
(provide 'ew-faces)
;;; ew-faces ends here
;; -------------------------------------------------------
