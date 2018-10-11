;;; ew-calc --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(require 's)
;; -------------------------------------------------------
(defun ew-calc-mkfloat(v)
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
;; -------------------------------------------------------
(defun ew-calc-nzdol2(v)
  "Format V as .2f, or empty string if zero-ish."
  (let (n)
    (setq n (ew-calc-mkfloat v))
    (setq n (/ (round (* n 100.0)) 100.0))
    (if (= 0.0 n) "" (format "%.2f" (ew-calc-mkfloat v)))))
;; -------------------------------------------------------
(defun ew-calc-plusdol2(r)
  "Format the sum of a range R as dollar or empty string."
  (ew-calc-nzdol2 (apply '+ (mapcar 'ew-calc-mkfloat r))))
;; -------------------------------------------------------
(defun ew-calc-minusdol2(r)
  "Format the difference of a range R as dollar or empty string."
  (ew-calc-nzdol2 (apply '- (mapcar 'ew-calc-mkfloat r))))
;; -------------------------------------------------------
(defun ew-calc-kvr(v r)
  "Bold if V and R differ, \"\" if either is 0."
  (catch 'lhs
    (let (nv nr)
      (setq nv (ew-calc-nzdol2 v))
      (setq nr (ew-calc-nzdol2 r))
      (when (or (s-blank? nv) (s-blank? nr))
        (throw 'lhs ""))
      (if (string-equal nv nr)
          nv
        (format "*%s*" nr)))))
;; -------------------------------------------------------
(provide 'ew-calc)
;;; ew-calc ends here
