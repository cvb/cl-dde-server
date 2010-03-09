(in-package :cl-dde-server)

(defconstant WM-NULL                         #x0000)
(defconstant WM-CREATE                       #x0001)
(defconstant WM-DESTROY                      #x0002)
(defconstant WM-MOVE                         #x0003)
(defconstant WM-SIZE                         #x0005)

(defconstant WM-ACTIVATE                     #x0006)
;/*
; * WM-ACTIVATE state values)
; */
(defconstant     WA-INACTIVE     0)
(defconstant     WA-ACTIVE       1)
(defconstant     WA-CLICKACTIVE  2)

(defconstant WM-SETFOCUS                     #x0007)
(defconstant WM-KILLFOCUS                    #x0008)
(defconstant WM-ENABLE                       #x000A)
(defconstant WM-SETREDRAW                    #x000B)
(defconstant WM-SETTEXT                      #x000C)
(defconstant WM-GETTEXT                      #x000D)
(defconstant WM-GETTEXTLENGTH                #x000E)
(defconstant WM-PAINT                        #x000F)
(defconstant WM-CLOSE                        #x0010)
(defconstant WM-QUERYENDSESSION              #x0011)
(defconstant WM-QUIT                         #x0012)
(defconstant WM-QUERYOPEN                    #x0013)
(defconstant WM-ERASEBKGND                   #x0014)
(defconstant WM-SYSCOLORCHANGE               #x0015)
(defconstant WM-ENDSESSION                   #x0016)
(defconstant WM-SHOWWINDOW                   #x0018)
(defconstant WM-WININICHANGE                 #x001A)

(defconstant CS-VREDRAW          #x0001)
(defconstant CS-HREDRAW          #x0002)
(defconstant CS-DBLCLKS          #x0008)
(defconstant CS-OWNDC            #x0020)
(defconstant CS-CLASSDC          #x0040)
(defconstant CS-PARENTDC         #x0080)
(defconstant CS-NOCLOSE          #x0200)
(defconstant CS-SAVEBITS         #x0800)
(defconstant CS-BYTEALIGNCLIENT  #x1000)
(defconstant CS-BYTEALIGNWINDOW  #x2000)
(defconstant CS-GLOBALCLASS      #x4000)

(defconstant CS-IME              #x00010000)


;*
; * Window Styles
; */
(defconstant WS-OVERLAPPED       #x00000000)
(defconstant WS-POPUP            #x80000000)
(defconstant WS-CHILD            #x40000000)
(defconstant WS-MINIMIZE         #x20000000)
(defconstant WS-VISIBLE          #x10000000)
(defconstant WS-DISABLED         #x08000000)
(defconstant WS-CLIPSIBLINGS     #x04000000)
(defconstant WS-CLIPCHILDREN     #x02000000)
(defconstant WS-MAXIMIZE         #x01000000)
(defconstant WS-CAPTION          #x00C00000)     ; WS-BORDER | WS-DLGFRAME  */
(defconstant WS-BORDER           #x00800000)
(defconstant WS-DLGFRAME         #x00400000)
(defconstant WS-VSCROLL          #x00200000)
(defconstant WS-HSCROLL          #x00100000)
(defconstant WS-SYSMENU          #x00080000)
(defconstant WS-THICKFRAME       #x00040000)
(defconstant WS-GROUP            #x00020000)
(defconstant WS-TABSTOP          #x00010000)

(defconstant WS-MINIMIZEBOX      #x00020000)
(defconstant WS-MAXIMIZEBOX      #x00010000)


(defconstant WS-TILED            WS-OVERLAPPED)
(defconstant WS-ICONIC           WS-MINIMIZE)
(defconstant WS-SIZEBOX          WS-THICKFRAME)

(defconstant WS-OVERLAPPEDWINDOW (logior WS-OVERLAPPED     
					 WS-CAPTION        
					 WS-SYSMENU        
					 WS-THICKFRAME     
					 WS-MINIMIZEBOX    
					 WS-MAXIMIZEBOX))


(defconstant WS-TILEDWINDOW      WS-OVERLAPPEDWINDOW)

;
; * Common Window Styles
; */


(defconstant WS-POPUPWINDOW      (logior WS-POPUP WS-BORDER WS-SYSMENU))

(defconstant WS-CHILDWINDOW      WS-CHILD)

(defconstant ws-ex-composited 33554432) 

(defconstant CW-USEDEFAULT       #x80000000)

;/*
; * ShowWindow() Commands
; */
(defconstant SW-HIDE             0)
(defconstant SW-SHOWNORMAL       1)
(defconstant SW-NORMAL           1)
(defconstant SW-SHOWMINIMIZED    2)
(defconstant SW-SHOWMAXIMIZED    3)
(defconstant SW-MAXIMIZE         3)
(defconstant SW-SHOWNOACTIVATE   4)
(defconstant SW-SHOW             5)
(defconstant SW-MINIMIZE         6)
(defconstant SW-SHOWMINNOACTIVE  7)
(defconstant SW-SHOWNA           8)
(defconstant SW-RESTORE          9)
(defconstant SW-SHOWDEFAULT      10)
(defconstant SW-FORCEMINIMIZE    11)
(defconstant SW-MAX              11)

(defconstant IDC-ARROW 32512)