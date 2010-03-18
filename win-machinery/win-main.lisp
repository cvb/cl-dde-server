(in-package :cl-dde-server)

(defvar *simple-window-class-atom* nil)

(defun register-simple-window-class (class-name)
  (or *simple-window-class-atom*
      (setq *simple-window-class-atom*
	    (with-foreign-string (cname class-name)
	      (with-foreign-object (w 'wndclassex)
		(with-foreign-slots ((cb-size
				      style
				      wnd-proc
				      cb-cls-extra
				      cb-wnd-extra
				      hinstance
				      hicon
				      hcursor
				      hbr-background
				      lpsz-menu-name
				      lpsz-class-name
				      hicon-sm)
				     w wndclassex)
		  (setf cb-size (foreign-type-size 'wndclassex)
			style (logior cs-hredraw cs-vredraw)
			wnd-proc (callback window-proc)
			cb-cls-extra 0
			cb-wnd-extra 0 
			hinstance (get-module-handle (make-pointer 0))
			hicon (make-pointer 0)
			hcursor (load-cursor (make-pointer 0) (make-pointer  IDC-ARROW))
			hbr-background (get-stock-object 0)
			lpsz-menu-name (make-pointer 0)
			lpsz-class-name cname
			hicon-sm (make-pointer 0))
		  (let ((atom (register-class-ex w)))
		    (if (eql 0 atom)
			(let ((err (get-last-error)))
			  (error "Error registering windows class ~s: ~d (~a)" class-name
				 err
				 (ccl::%windows-error-string err))))
		    atom)))))))

(defun make-simple-window ()
  (let ((class-atom (register-simple-window-class "test")))
    (with-foreign-string (title "my window!")
      (let ((hwnd (create-window-ex 0
				 (make-pointer class-atom)
				 title
				 (logior ws-ex-composited ws-overlappedwindow)
				 0
				 0
				 100
				 100
				 (make-pointer 0)
				 (make-pointer 0)
				 (get-module-handle (make-pointer 0))
				 (make-pointer 0))))
	(when (null-pointer-p hwnd)
	  (error "CreateWindow failed: ~a" (ccl::%windows-error-string (get-last-error))))

;	(show-window hwnd sw-show)
;	(show-window hwnd sw-show)
	(update-window hwnd)
	(with-foreign-object (msg 'msg)
	  (do* ((result (get-message msg (make-pointer 0) 0 0)
			(get-message msg (make-pointer 0) 0 0)))
	       ((eql 0 result)
		(foreign-slot-value msg 'msg 'wparam))
	    (cond ((< result 0)
		   (let ((error (get-last-error)))
		     (format t "~& GetMessage: error = ~d (~a)" error
			     (ccl::%windows-error-string error)))
		   (return))
		  ((eql *initiated* nil) (return))
		  (t (translate-message msg)
		     (dispatch-message msg)))))))))
