;;; ew-modeline -- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(setq-default
 ew-modeline-isroot-regexp
  "^/\\(sudo\\|ssh:root\\)")
;; -------------------------------------------------------
(setq-default
 ew-modeline-isremote-regexp
  "^/\\(ssh:\\|e1/\\)")
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
;; -------------------------------------------------------
(defun ew-modeline-isroot-buffer()
  "If a root buffer."
  (string-match
   ew-modeline-isroot-regexp
   (currentbufferfilepath)))
;; -------------------------------------------------------
(defun ew-modeline-isremote-buffer()
  "If a remote buffer."
  (string-match
   ew-modeline-isremote-regexp
   (currentbufferfilepath)))
;; -------------------------------------------------------
(cond
 ((string= "p13a" (system-name))
  (progn
    (defun ew-modeline-height0() 150)
    (defun ew-modeline-height1() 200)
    (defun ew-modeline-height2() 240)))
 (t (progn
    (defun ew-modeline-height0() 110)
    (defun ew-modeline-height1() 140)
    (defun ew-modeline-height2() 160))))
;; -------------------------------------------------------
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
     ((buffer-modified-p)
      (propertize "m" 'face 'mode-line-modified-face))
     (t "")))

   (:eval
    (cond
     ((ew-modeline-isremote-buffer)
      (propertize "r" 'face 'mode-line-isremote-face))
     (t "")))

   (:eval
    (cond
     ((ew-modeline-isroot-buffer)
      (propertize "su" 'face 'mode-line-isroot-face))
     (t "")))

   " "

   (:eval
    (propertize
     "%b" 'face
     (if (ew-modeline-isroot-buffer)
         'mode-line-filename-face
       'mode-line-filename-face)))

   " "

   (:propertize "%lx" face mode-line-number-face)

   (:eval
    (propertize
     "%c" 'face
     (if (>= (current-column) 58)
         'mode-line-80col-face
       'mode-line-position-face)))

   " "

   ;; "%n"
   ;; " "

   (:propertize mode-name face mode-line-mode-face)

   (:propertize mode-line-process face mode-line-process-face)

   ;; (vc-mode vc-mode)

   (:eval
    (propertize
     (format-mode-line minor-mode-alist)
     'face
     'mode-line-minor-mode-face))

   (global-mode-string global-mode-string)

   mode-line-client
   ))
;; -------------------------------------------------------
;; Extra mode line faces
(make-face 'mode-line-80col-face)
(make-face 'mode-line-dedicated-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-indicator-face)
(make-face 'mode-line-isroot-face)
(make-face 'mode-line-isremote-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-number-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-root-filename-face)
;; -------------------------------------------------------
;; main
(ewtf :height (ew-modeline-height0) 'mode-line)
(ewtf :foreground "gray70" 'mode-line)
(ewtf :background "#131" 'mode-line)
(ewtf :box '(:line-width 2 :color "gray30") 'mode-line)
(ewtf :inverse-video nil 'mode-line)
(ewtf :family "Noto Sans" 'mode-line)
;; -------------------------------------------------------
;; inactive
(ewtf :foreground "gray50" 'mode-line-inactive)
(ewtf :background "gray10" 'mode-line-inactive)
(ewtf :inverse-video nil 'mode-line-inactive)
(ewtf :height (ew-modeline-height0) 'mode-line-inactive)
(ewtf :box '(:line-width 2 :color "gray20") 'mode-line-inactive)
;; -------------------------------------------------------
;; filename
(ewtf :height (ew-modeline-height2) 'mode-line-filename-face)
(ewtf :weight 'bold 'mode-line-filename-face)
(ewtf :foreground "#fc0" 'mode-line-filename-face)
;; -------------------------------------------------------
;; root filename
(ewtf :inherit 'mode-line-filename-face 'mode-line-root-filename-face)
(ewtf :foreground "#f30" 'mode-line-root-filename-face)
;; -------------------------------------------------------
;; folder
(ewtf :foreground "gray60" 'mode-line-folder-face)
;; -------------------------------------------------------
;; row number
(ewtf :height (ew-modeline-height0) 'mode-line-number-face)
;; -------------------------------------------------------
;; column position
(ewtf :height (ew-modeline-height0) 'mode-line-position-face)
;; -------------------------------------------------------
;; major mode
(ewtf :foreground "#6f6" 'mode-line-mode-face)
(ewtf :weight 'bold 'mode-line-mode-face)
(ewtf :height (ew-modeline-height0) 'mode-line-mode-face)
;; -------------------------------------------------------
;; minor mode
(ewtf :foreground "gray50" 'mode-line-minor-mode-face)
(ewtf :height (ew-modeline-height0) 'mode-line-minor-mode-face)
;; -------------------------------------------------------
;; process
(ewtf :foreground "#718c00" 'mode-line-process-face)
;; -------------------------------------------------------
;; 80-col
(ewtf :weight 'bold 'mode-line-80col-face)
(ewtf :height (ew-modeline-height1) 'mode-line-80col-face)
(ewtf :foreground "#f44" 'mode-line-80col-face)
(ewtf :box '(:line-width 2) 'mode-line-80col-face)
;; -------------------------------------------------------
;; indicators
(ewtf :height (ew-modeline-height2) 'mode-line-indicator-face)
(ewtf :weight 'bold 'mode-line-indicator-face)
(ewtf :box '(:line-width 2) 'mode-line-indicator-face)
;; -------------------------------------------------------
;; indicator: read-only
(ewtf :inherit 'mode-line-indicator-face 'mode-line-read-only-face)
(ewtf :foreground "gray70" 'mode-line-read-only-face)
;; -------------------------------------------------------
;; indicator: modified
(ewtf :inherit 'mode-line-indicator-face 'mode-line-modified-face)
(ewtf :foreground "#ff40ff" 'mode-line-modified-face)
;; -------------------------------------------------------
;; indicator: dedicated
(ewtf :inherit 'mode-line-indicator-face 'mode-line-dedicated-face)
(ewtf :foreground "#0cf" 'mode-line-dedicated-face)
;; -------------------------------------------------------
;; indicator: isroot
(ewtf :inherit 'mode-line-indicator-face 'mode-line-isroot-face)
(ewtf :foreground "#ff1010" 'mode-line-isroot-face)
;; -------------------------------------------------------
;; indicator: isremote
(ewtf :inherit 'mode-line-indicator-face 'mode-line-isremote-face)
(ewtf :foreground "#ff7f00" 'mode-line-isremote-face)
;; -------------------------------------------------------
(provide 'ew-modeline)
;;; ew-modeline ends here
;; -------------------------------------------------------
