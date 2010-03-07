(defpackage #:cl-dde-server-asd
  (:use :cl :asdf))

(in-package #:cl-dde-server-asd)

(defsystem cl-dde-server
  :name "cl-dde-server"
  :version "0.0.1"
  :version "GPLv3"
  :depends-on (:cffi :binary-types :usocket :rsm-queue)
  :serial ((:file "cl-dde"))