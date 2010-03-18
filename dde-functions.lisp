(in-package :cl-dde-server)

(defvar *instance-id* nil)
(defvar *service-name* nil)
(defvar *initiated* nil)
(defvar *callback-function* nil)

(defun dde-handle-to-string (h)
  (let ((len (+ 1 (dde-query-string *instance-id* h (make-pointer 0) 0 cp-winansi))))
    (with-foreign-pointer (s len s-len)
      (dde-query-string *instance-id* h s s-len cp-winansi)
      (foreign-string-to-lisp s))))

(defun dde-server-init ()
  (with-foreign-pointer (inst (foreign-type-size 'dword))
    (let* ((init-ret (dde-initialize inst (callback dde-callback) appclass-standard 0)))
      (setf *instance-id* (mem-ref inst 'dword))
      (format t "Return code of dde-initialize: ~a" init-ret)
      init-ret)))

(defun set-service-name (name)
  (let ((hservice (create-string-handler *instance-id* name cp-winansi)))
    (dde-name-service *instance-id* hservice 0 dns-register)
    (setf *service-name* '(name hservice))))

(defun get-service-name ()
  *service-name*)

(defcallback dde-callback hddedata
    ;; Use this callback to handle data
    ((uType :uint)
     (uFmt :uint)
     (hconv hddedata)
     (hsz1 hsz)
     (hsz2 hsz)
     (hdata hddedata)
     (dwData1 ulptr)
     (dwData2 ulptr))
  (cond
    ((= utype xtyp-connect) (progn (format t "Recieved connect~%" ) (make-pointer 1)))
    ((= utype xtyp-poke)
     (progn
       (with-foreign-object (data-len :ulong)
	 (let* ((data-addr (dde-access-data hdata data-len))
		(hsz1-lisp (dde-handle-to-string hsz1)))
	   (if (null-pointer-p data-addr)
	       (format t "GALAKTEKO OPASNOSTE!!11 DATA IS NULL~%")
	       (let ((my-ptr (foreign-alloc :uint8 :count (mem-ref data-len :ulong)))
		     (data-len (mem-ref data-len :ulong)))
		 (dde-get-data hdata my-ptr data-len 0)
		 (dde-unaccess-data hdata)
		 (funcall *callback-function* hsz1-lisp my-ptr)
		 (make-pointer dde-fack)))))))
    (t (progn (format t "Recieved! ~a~%" utype) (make-pointer 0)))))

(defun start-dde-server (name callback-function)
  (unwind-protect
       (progn
;	 (make-callback :poke callback-function)
	 (setf *callback-function* callback-function)
	 (dde-server-init)
	 (set-service-name name)
	 (setf *initiated* t)
	 (make-simple-window))
    (progn (dde-name-service *instance-id* service 0 dns-unregister)
	   (free-string-handler *instance-id* (elt *service-name* 1))
	   (dde-uninitialize *instance-id*)
	   (setf *initiated* nil))))

(defun stop-dde-server ()
  (setf *initiated* nil))

;; (logand i #xFFFF) -- это каст (WORD)
;; (defun MAKEINTRESOURCE ()
;;    (cffi:make-pointer (logand i #xFFFF)))