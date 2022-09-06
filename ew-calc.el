;;; ew-calc --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(message "loading ew-calc")

(require 's)

(defun ewc-mkfloat(v)
  "Make a float out of V, whatever it is."
  (catch 'lhs
    (cond
     ((not     v) (throw 'lhs 0.0))
     ((floatp  v) (throw 'lhs v))
     ((numberp v) (throw 'lhs (float v)))
     ((stringp v)
      (let (sv)
        (setq sv (car (s-split "\*" v t)))
        (if sv
          (throw 'lhs (float (string-to-number sv)))
          (throw 'lhs 0.0))))
     (t (error "Gack mkfloat %s %S" (type-of v) v)))))

(defun ewc-nzdol2(v)
  "Format V as .2f, or empty string if zero-ish."
  (let (n)
    (setq n (ewc-mkfloat v))
    (setq n (/ (round (* n 100.0)) 100.0))
    (if (= 0.0 n) "" (format "%.2f" (ewc-mkfloat v)))))
(defalias 'ewnz2 'ewc-nzdol2)

(defun ewc-plusdol2(r)
  "Format the sum of a range R as dollar or empty string."
  (ewc-nzdol2 (apply '+ (mapcar 'ewc-mkfloat r))))

(defun ewc-minusdol2(r)
  "Format the difference of a range R as dollar or empty string."
  (ewc-nzdol2 (apply '- (mapcar 'ewc-mkfloat r))))

(defun ewc-timesdol2(r)
  "Format the product of a range R as dollar or empty string."
  (ewc-nzdol2 (apply '* (mapcar 'ewc-mkfloat r))))

(defun ewc-divdol2(r)
  "Format the quotient of a range R as dollar or empty string."
  (ewc-nzdol2 (apply '/ (mapcar 'ewc-mkfloat r))))

(defun ewc-kvr(v r)
  "Bold if V and R differ, \"\" if either is 0."
  (catch 'lhs
    (let (nv nr)
      (setq nv (ewc-nzdol2 v))
      (setq nr (ewc-nzdol2 r))
      (when (or (s-blank? nv) (s-blank? nr))
        (throw 'lhs ""))
      (if (string-equal nv nr)
          nv
        (format "*%s*" nr)))))

(defun ewc-timeval-from-string (time-string)
  "Calculate timeval from TIME-STRING."
  (let* ((timestr
          (replace-regexp-in-string
           "[]<>[]"
           ""
           time-string))
         (timeval (date-to-time timestr)))
    timeval))

(defun ewc-seconds-from-string (time-string)
  "Calculate seconds from TIME-STRING."
  (float-time (ewc-timeval-from-string time-string)))

(defun ewc-secs-diff (t2 t1)
  "Calculate seconds difference between times T2 and T1."
  (- (ewc-seconds-from-string t2)
     (ewc-seconds-from-string t1)))

(defun ewc-minutes-diff (t2 t1)
  "Calculate minutes difference between times T2 and T1."
  (/ (ewc-secs-diff t2 t1) 60))

;; -------------------------------------------------------
;; Local Variables:
;; mode: emacs-lisp
;; read-symbol-shorthands: (("ewc-" . "ew-calc-"))
;; End:
(provide 'ew-calc)
;;; ew-calc.el ends here
