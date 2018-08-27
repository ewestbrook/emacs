;;; ew-calc --- Summary
;;; Commentary:
;;; Code:
;; -------------------------------------------------------
(defun ew-calc-nzdol2(v)
  "Format V as dollar format, or empty string if zero-ish."
  (let (n)
    (if (numberp v)
        (setq n v)
      (setq n (string-to-number v)))
    (setq n (/ (round (* n 100.0)) 100.0))
    (if (= 0.0 n) "" (format "%.2f" n))))
;; -------------------------------------------------------
(defun ew-calc-plusdol2(r)
  "Format the sum of a range R as dollar or empty string."
  (ew-calc-nonzero-dollar (apply '+ r)))
;; -------------------------------------------------------
(defun ew-calc-minusdol2(r)
  "Format the difference of a range R as dollar or empty string."
  (ew-calc-nonzero-dollar (apply '- r)))
;; -------------------------------------------------------
(defun ew-calc-kvr(v r)
  "Check V for match with R.."
  (catch 'nz
    (when (or
           (and (stringp v) (string-equal "" v))
           (and (stringp r) (string-equal "" r))
           (throw 'nz "")))
    (let (nv nr)
      (setq nv (if (stringp v) (float (string-to-number v)) v))
      (setq nr (if (stringp r) (float (string-to-number r)) r))
      (if (= nv nr) "ok" "oops"))))
;; -------------------------------------------------------
(provide 'ew-calc)
;;; ew-calc ends here
