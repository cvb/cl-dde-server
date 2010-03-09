(in-package :cl-dde-server)

(defctype hwnd :pointer)
(defctype wparam :uint) ;looks like it should be pointer
(defctype lparam :long)
;(defctype point point)
(defctype hinstance :pointer)
(defctype lpcstr (:pointer :char))
(defctype hmodule :pointer)
(defctype lresult :long)
(defctype hicon :pointer)
(defctype hcursor :pointer)
(defctype hbrush :pointer)
(defctype atom :uint16)
(defctype hgdiobj :pointer)
(defctype dword :uint32)
(defctype hconv (:pointer :int))
(defctype hsz (:pointer :int))
(defctype uint :uint32)
(defctype dword* (:pointer :uint))
(defctype word :uint16)
(defctype lpdword (:pointer dword))
;; Actually thi is far pointer to byte
;; typedef BYTE far *LPBYTE;
;; Try to use usual pointer, and hope for the best.
(defctype lpbyte :pointer)
(defctype lptstr (:pointer :char))
(defctype intptr (:pointer :int))
(defctype hddedata :pointer)
(defctype lpstr (:pointer :char))

(defctype ulptr (:pointer :ulong))

(defctype hresult :long)

(defcstruct point
  (x :int)
  (y :int))

(defcstruct msg
  (hwnd hwnd)
  (message :uint)
  (wparam wparam)
  (lparam lparam)
  (time dword)
  (pt point))

(defcstruct wndclass 
  (style :uint)
  (wnd-proc :pointer)
  (cbClsExtra :int)
  (cbWndExtra :int)
  (hInstance hinstance)
  (hicon hicon)
  (hcursor hcursor)
  (hbr-background hbrush)
  (lpsz-menu-name lpcstr)
  (lpsz-class-name lpstr))

(defcstruct wndclassex
  (cb-size :uint)
  (style :uint)
  (wnd-proc :pointer)
  (cb-cls-extra :int)
  (cb-wnd-extra :int)
  (hinstance hinstance)
  (hicon hicon)
  (hcursor hcursor)
  (hbr-background hbrush)
  (lpsz-menu-name lpcstr)
  (lpsz-class-name lpstr)
  (hicon-sm hicon))
