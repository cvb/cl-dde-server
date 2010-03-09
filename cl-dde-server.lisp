(defpackage :cl-dde-server
  (:use :cl :cffi)
  (:export :stop-dde-server :start-dde-server *initiated* *service-name*))

(in-package :cl-dde-server)

(define-foreign-library user32 
    (t (:default "user32")))

(use-foreign-library user32)

