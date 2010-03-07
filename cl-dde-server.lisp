(defpackage :cl-dde-server
  (:use :cl :cffi))

(define-foreign-library user32 
    (t (:default "user32")))

(use-foreign-library user32)
