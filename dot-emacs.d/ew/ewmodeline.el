;;; ewmodeline -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(defun currentbufferfilepath(&optional @dir-path-only-p)
  "Current buffer file path."
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (if @dir-path-only-p
        (file-name-directory $fpath)
      $fpath)))

(defun ewmodeline-is-root-buffer()
  "If a root buffer."
  (string-match "\\(sudo\\|ssh:root\\)" (currentbufferfilepath))
  )

(setq-default
 mode-line-format
 '(

   (:eval
    (cond
     ((window-dedicated-p)
      (propertize "d" 'face 'mode-line-dedicated-face))
     (t "")))

   (:eval
    (cond
     (buffer-read-only
      (propertize "ro" 'face 'mode-line-read-only-face))
     (t "")))

   (:eval
    (cond
     ((ewmodeline-is-root-buffer)
      (propertize "su" 'face 'mode-line-isroot-face))
     (t "")))

   (:eval
    (cond
     ((buffer-modified-p)
      (propertize "m" 'face 'mode-line-modified-face))
     (t "")))

   (:propertize " " face mode-line)

   (:eval
    (propertize "%b" 'face
                 (if (ewmodeline-is-root-buffer)
                     'mode-line-filename-face
                   'mode-line-filename-face)))

   (:propertize " " face mode-line)

   (:propertize "%l" face mode-line-number-face)

   (:propertize "x" face mode-line)

   (:eval
    (propertize "%c" 'face
                (if (>= (current-column) 58)
                    'mode-line-80col-face
                  'mode-line-position-face)))

   (:propertize " " face mode-line)

   "%n"

   (:propertize " " face mode-line)

   (:propertize mode-name
                face mode-line-mode-face)
   (:propertize mode-line-process
                face mode-line-process-face)
   ;; (vc-mode vc-mode)
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   (global-mode-string global-mode-string)
   mode-line-client
   ))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-root-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-number-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)
(make-face 'mode-line-dedicated-face)
(make-face 'mode-line-isroot-face)
(make-face 'mode-line-indicator-face)

;; general face
(ewtf :foreground    "gray60" 'mode-line)
(ewtf :inverse-video nil 'mode-line)
(ewtf :height        100 'mode-line)
(ewtf :family        "Noto Sans" 'mode-line)
(if (eq 0 (user-uid))
    (progn
      (ewtf :background    "#622" 'mode-line)
      (ewtf :box
            '(:line-width 2 :color "#833" :style nil)
            'mode-line))
  (progn
    (ewtf :background    "#242" 'mode-line)
    (ewtf :box
          '(:line-width 2 :color "#383" :style nil)
          'mode-line)))

;; inactive general face
(ewtf :foreground "gray50" 'mode-line-inactive)
(ewtf :background "gray10" 'mode-line-inactive)
(ewtf :inverse-video nil 'mode-line-inactive)
(ewtf :height 100 'mode-line-inactive)
(ewtf :box '(:line-width 2 :color "gray30" :style nil)
      'mode-line-inactive)

;; filename face
(ewtf :inherit 'mode-line 'mode-line-filename-face)
(ewtf :height 140 'mode-line-filename-face)
(ewtf :weight 'bold 'mode-line-filename-face)
(ewtf :foreground "#eab700" 'mode-line-filename-face)
(ewtf :slant 'normal 'mode-line-filename-face)

;; root filename face
(ewtf :inherit 'mode-line-filename-face
      'mode-line-root-filename-face)
(ewtf :foreground "#f30" 'mode-line-root-filename-face)
;; (ewtf :slant 'italic 'mode-line-root-filename-face)
(ewtf :slant 'normal 'mode-line-root-filename-face)

;; general indicator face
(ewtf :inherit 'mode-line 'mode-line-indicator-face)
(ewtf :height 140 'mode-line-indicator-face)
(ewtf :weight 'bold 'mode-line-indicator-face)

;; read-only indicator face
(ewtf :inherit 'mode-line-indicator-face 'mode-line-read-only-face)
(ewtf :background nil 'mode-line-read-only-face)
(ewtf :foreground "gray70" 'mode-line-read-only-face)
(ewtf :box '(:line-width 2 :color "#888")
      'mode-line-read-only-face)

;; modified indicator face
(ewtf :inherit 'mode-line-indicator-face 'mode-line-modified-face)
(ewtf :foreground "#f4c" 'mode-line-modified-face)
(ewtf :background nil 'mode-line-modified-face)
(ewtf :box '(:line-width 2 :color "#f4c")
      'mode-line-modified-face)

;; dedicated indicator face
(ewtf :inherit 'mode-line-indicator-face 'mode-line-dedicated-face)
(ewtf :background nil 'mode-line-dedicated-face)
(ewtf :foreground "#0cf" 'mode-line-dedicated-face)
(ewtf :box '(:line-width 2 :color "#0cf")
      'mode-line-dedicated-face)

;; isroot indicator face
(ewtf :inherit 'mode-line-indicator-face 'mode-line-isroot-face)
(ewtf :background nil 'mode-line-isroot-face)
(ewtf :foreground "#f22" 'mode-line-isroot-face)
(ewtf :box '(:line-width 2 :color "#f22")
      'mode-line-isroot-face)

;; folder face
(ewtf :inherit 'mode-line 'mode-line-folder-face)
(ewtf :foreground "gray60" 'mode-line-folder-face)

;; number (row) face
(ewtf :inherit 'mode-line-position-face
      'mode-line-number-face)
(ewtf :height 110 'mode-line-number-face)

;; position (column) face
(ewtf :inherit 'mode-line 'mode-line-position-face)
(ewtf :height 110 'mode-line-position-face)

;; mode (name) face
(ewtf :inherit 'mode-line 'mode-line-mode-face)
(ewtf :foreground "#2f2" 'mode-line-mode-face)
(ewtf :weight 'bold 'mode-line-mode-face)
(ewtf :height 110 'mode-line-mode-face)

;; minor mode face
(ewtf :inherit 'mode-line-mode-face
      'mode-line-minor-mode-face)
(ewtf :foreground "gray40" 'mode-line-minor-mode-face)
(ewtf :height 100 'mode-line-minor-mode-face)

;; process face
(ewtf :inherit 'mode-line 'mode-line-process-face)
(ewtf :foreground "#718c00" 'mode-line-process-face)

;; 80col face
(ewtf :inherit 'mode-line-position-face
      'mode-line-80col-face)
;; (ewtf :slant 'italic 'mode-line-80col-face)
;; (ewtf :slant 'normal 'mode-line-80col-face)
(ewtf :weight 'bold 'mode-line-80col-face)
(ewtf :height 120 'mode-line-80col-face)
(ewtf :foreground "#f44" 'mode-line-80col-face)
;; -------------------------------------------------------
(provide 'ewmodeline)
;;; ewmodeline ends here
