(in-package :cl-dde-server)

(define-foreign-library user32 
    (t (:default "user32")))

(use-foreign-library user32)

(defcfun ("DdeCreateStringHandleA" create-string-handler) hsz 
  (id-inst dword)         ;; instance identifier 
  (string :string)        ;; string to register 
  (code-page :int))        ;; Windows ANSI code page 

(defcfun ("DdeFreeStringHandle" free-string-handler) :boolean
  (id-inst dword)
  (string-handler hsz))
;; DdeInitialize(&idInst,         // receives instance identifier 
;;     (PFNCALLBACK) DdeCallback, // pointer to callback function 
;;     CBF_FAIL_EXECUTES |        // filter XTYPE_EXECUTE 
;;     CBF_SKIP_ALLNOTIFICATIONS, // filter notifications 
;;     0); 

(defcfun ("DdeInitializeA" dde-initialize) :uint
  (id-inst (:pointer dword))
  (fn-callback :pointer)
  (afcmd dword)
  (ulres dword))

;;  BOOL DdeUninitialize(      
;;     DWORD idInst
;; );

(defcfun ("DdeUninitialize" dde-uninitialize) :boolean
  (id-inst dword))

;; LPBYTE DdeAccessData(      
;;     HDDEDATA hData,
;;     LPDWORD pcbDataSize
;; );

(defcfun ("DdeAccessData" dde-access-data) lpbyte
  (data hddedata)
  (pcb-data-size lpdword))

;; BOOL DdeUnaccessData(      
;;    HDDEDATA hData
;; );

(defcfun ("DdeUnaccessData" dde-unaccess-data) :boolean
  (data hddedata ))

(defcfun ("DdeGetData" dde-get-data) hddedata
  (data hddedata)
  (dst lpbyte)
  (cb-max dword)
  (cb-off dword))
 
;;  HDDEDATA DdeNameService(      
;;     DWORD idInst,
;;     UINT hsz1,
;;     UINT hsz2,
;;     UINT afCmd
;; );

(defcfun ("DdeNameService" dde-name-service) hddedata
  (id-inst dword)
  (hsz1 hsz)
  (hsz2 :uint)
  (afcmd :uint))

(defcfun ("DdeQueryStringA" dde-query-string) dword
  (id-inst dword)
  (hsz1 hsz)
  (pointer-to-buffer :pointer)
  (buffer-size dword)
  (code-page :uint))

(defcfun ("DdeConnect" dde-connect) hconv 
  (id-inst dword)
  (service hsz)
  (topic hsz)
  (context :pointer))