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
;; -------------------------------------------------------
(defun ewmodeline-is-root-buffer()
  "If a root buffer."
  (string-match "\\(sudo\\|ssh:root\\)" (currentbufferfilepath))
  )
;; -------------------------------------------------------
(cond
 ((string= "p13a" (system-name))
  (progn
    (defun ewmodeline-height0() 150)
    (defun ewmodeline-height1() 200)
    (defun ewmodeline-height2() 240)))
 (t (progn
    (defun ewmodeline-height0() 110)
    (defun ewmodeline-height1() 140)
    (defun ewmodeline-height2() 160))))
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
     ((ewmodeline-is-root-buffer)
      (propertize "su" 'face 'mode-line-isroot-face))
     (t "")))

   " "

   (:eval
    (propertize
     "%b" 'face
     (if (ewmodeline-is-root-buffer)
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
(ewtf :height (ewmodeline-height0) 'mode-line)
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
(ewtf :height (ewmodeline-height0) 'mode-line-inactive)
(ewtf :box '(:line-width 2 :color "gray20") 'mode-line-inactive)
;; -------------------------------------------------------
;; filename
(ewtf :height (ewmodeline-height2) 'mode-line-filename-face)
(ewtf :weight 'bold 'mode-line-filename-face)
(ewtf :foreground "#eab700" 'mode-line-filename-face)
;; -------------------------------------------------------
;; root filename
(ewtf :inherit 'mode-line-filename-face 'mode-line-root-filename-face)
(ewtf :foreground "#f30" 'mode-line-root-filename-face)
;; -------------------------------------------------------
;; folder
(ewtf :foreground "gray60" 'mode-line-folder-face)
;; -------------------------------------------------------
;; row number
(ewtf :height (ewmodeline-height0) 'mode-line-number-face)
;; -------------------------------------------------------
;; column position
(ewtf :height (ewmodeline-height0) 'mode-line-position-face)
;; -------------------------------------------------------
;; major mode
(ewtf :foreground "#6f6" 'mode-line-mode-face)
(ewtf :weight 'bold 'mode-line-mode-face)
(ewtf :height (ewmodeline-height0) 'mode-line-mode-face)
;; -------------------------------------------------------
;; minor mode
(ewtf :foreground "gray50" 'mode-line-minor-mode-face)
(ewtf :height (ewmodeline-height0) 'mode-line-minor-mode-face)
;; -------------------------------------------------------
;; process
(ewtf :foreground "#718c00" 'mode-line-process-face)
;; -------------------------------------------------------
;; 80-col
(ewtf :weight 'bold 'mode-line-80col-face)
(ewtf :height (ewmodeline-height1) 'mode-line-80col-face)
(ewtf :foreground "#f44" 'mode-line-80col-face)
(ewtf :box '(:line-width 2) 'mode-line-80col-face)
;; -------------------------------------------------------
;; indicators
(ewtf :height (ewmodeline-height2) 'mode-line-indicator-face)
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
