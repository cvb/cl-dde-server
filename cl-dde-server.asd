(defpackage #:cl-dde-server-asd
  (:use :cl :asdf))

(in-package #:cl-dde-server-asd)

(defsystem cl-dde-server
  :name "cl-dde-server"
  :version "0.0.1"
  :version "GPLv3"
  :depends-on (:cffi)
  :components ((:module win-machinery
			:depends-on ("cl-dde-server")
			:components
			((:file "win-constants")
			 (:file "c-types")
			 (:file "cffi-functions"
				:depends-on ("win-constants" "c-types"))
			 (:file "win-main"
				:depends-on ("cffi-functions"))))
	       (:file "dde-constants"
		      :depends-on ("cl-dde-server"))
	       (:file "c-types"
		      :depends-on ("cl-dde-server"))
	       (:file "cffi-dde-functions"
		      :depends-on ("cl-dde-server" "c-types" "dde-constants"))
	       (:file "dde-functions"
		      :depends-on ("cl-dde-server" "c-types" "cffi-dde-functions"))
	       (:file "cl-dde-server")))