;; Mode line setup
(setq-default
 mode-line-format
 '(
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize "RO" 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize "M" 'face 'mode-line-modified-face))
          (t " ")))
   " "
   ; directory and buffer/file name
   ;; (:propertize (:eval (shorten-directory default-directory 10))
   ;;              face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; Position, including warning for 80 columns
   (:propertize " %l" face mode-line-number-face)
   (:propertize " " face mode-line-position-face)
   (:eval (propertize "%c" 'face
                      (if (>= (current-column) 58)
                          'mode-line-80col-face
                        'mode-line-position-face)))
   " "
   ; narrow [default -- keep?]
   "%n"
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   (vc-mode vc-mode)
   " %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%] "
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   (:propertize mode-line-process
                face mode-line-process-face)
   (global-mode-string global-mode-string)
   ; emacsclient [default -- keep?]
   mode-line-client
   ; nyan-mode uses nyan cat as an alternative to %p
   ;; (:eval (when nyan-mode (list (nyan-create))))
   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-number-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(if (eq 0 (user-uid))
    (set-face-attribute 'mode-line nil
                        :foreground "gray60"
                        :background "#422"
                        :inverse-video nil
                        :height 100
                        :family "Ubuntu"
                        :box '(:line-width 2 :color "#622" :style nil))
  (set-face-attribute 'mode-line nil
                      :foreground "gray60"
                      :background "#242"
                      :inverse-video nil
                      :height 100
                      :family "Ubuntu"
                      :box '(:line-width 2 :color "#262" :style nil)))

(if (eq 0 (user-uid))
    (set-face-attribute 'mode-line-filename-face nil
                        :inherit 'mode-line-face
                        :foreground "red"
                        :height 200
                        :weight 'bold
                        :slant 'italic)
  (set-face-attribute 'mode-line-filename-face nil
                      :inherit 'mode-line-face
                      :foreground "#eab700"
                      :height 200
                      :weight 'bold
                      :slant 'normal
                      ))

(set-face-attribute 'mode-line-inactive nil
    :foreground "gray80" :background "gray10"
    :inverse-video nil
    :box '(:line-width 2 :color "gray10" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#888"
    :height 200
    :weight 'bold
    :box '(:line-width 2 :color "#888"))

(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#d400ff"
    :weight 'bold
    :height 200
    :box '(:line-width 2 :color "#d400ff"))
 
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60")

(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :height 120
    :family "Ubuntu Mono")

(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")

(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray40")

(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")

(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    ;; :foreground "black"
    ;; :background "#d44"
    :slant 'italic
    :weight 'normal
    :height 140
    )

(set-face-attribute 'mode-line-number-face nil
    :inherit 'mode-line-position-face
    :height 160)
