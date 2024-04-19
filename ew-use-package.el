;;; ew-use-package -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------

(message "ew-use-package.el")

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("orgmode" . "https://orgmode.org/elpa/"))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(package-install 'use-package)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  ;; (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-at-time "03:00"))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; End:
(provide 'ew-use-package)
;;; ew-use-package.el ends here
