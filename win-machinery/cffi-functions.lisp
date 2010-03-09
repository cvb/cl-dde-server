(in-package :cl-dde-server)

(define-foreign-library kernel32
    (t (:default "kernel32")))

(use-foreign-library user32)


(defcfun ("GetModuleHandleA" get-module-handle) hmodule
    (lp-module-name lpcstr))

(defcfun ("CreateWindow" create-window) hwnd
  (lp-class-name lpcstr)
  (lp-window-name lpcstr)
  (dw-stype dword)
  (x :int)
  (y :int)
  (nwidth :int)
  (nheight :int)
  (hwnd-parent hwnd)
  (hmenu :pointer)
  (hinstance hinstance)
  (lparam :pointer))

(defcfun ("CreateWindowExA" create-window-ex) hwnd
  (dw-ex-style dword)
  (lp-class-name lpcstr)
  (lp-window-name lpcstr)
  (dw-stype dword)
  (x :int)
  (y :int)
  (nwidth :int)
  (nheight :int)
  (hwnd-parent hwnd)
  (hmenu :pointer)
  (hinstance hinstance)
  (lparam :pointer))



(defcfun ("PostQuitMessage" post-quit-message) :void
  (exit-code :int))

(defcfun ("DefWindowProcA" def-window-proc) lresult
  (hwnd hwnd)
  (msg :uint)
  (wparam wparam)
  (lparam lparam))

(defcfun ("LoadCursorA" load-cursor) hcursor
  (hinstance hinstance)
  (lp-cursor-name lpcstr))

(defcfun ("GetStockObject" get-stock-object) hgdiobj
  (fn-object :int))

(defcfun ("RegisterClassExA" register-class-ex) atom
  (lpwcx :pointer))

(defcfun ("GetLastError" get-last-error) dword)
  


(defcfun ("ShowWindow" show-window) :boolean
  (hwnd hwnd)
  (ncmd-show :int))

(defcfun ("UpdateWindow" update-window) :boolean
  (hwnd hwnd))

(defcfun ("GetMessageA" get-message) hresult
  (msg :pointer) ;; Out
  (hwnd hwnd)
  (msg-filter-min :uint)
  (msg-filter-max :uint))
;  (pf-result (:pointer :boolean))) ;;Out

(defcfun ("TranslateMessage" translate-message) :boolean
  (msg (:pointer msg)))

(defcfun ("DispatchMessageA" dispatch-message)  lresult
  (msg (:pointer msg)))

(defcallback window-proc :long
    ((hwnd hwnd)
     (umsg :uint)
     (wparam wparam)
     (lparam lparam))
  (cond ((eql umsg wm-destroy) (post-quit-message 0) 0)
	(t (def-window-proc hwnd umsg wparam lparam))))
