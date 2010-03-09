(in-package :cl-dde-server)

;; Filter flags
(defconstant     CBF-FAIL-SELFCONNECTIONS     #x00001000)
(defconstant     CBF-FAIL-CONNECTIONS         #x00002000)
(defconstant     CBF-FAIL-ADVISES             #x00004000)
(defconstant     CBF-FAIL-EXECUTES            #x00008000)
(defconstant     CBF-FAIL-POKES               #x00010000)
(defconstant     CBF-FAIL-REQUESTS            #x00020000)
(defconstant     CBF-FAIL-ALLSVRXACTIONS      #x0003f000)

(defconstant     CBF-SKIP-CONNECT-CONFIRMS    #x00040000)
(defconstant     CBF-SKIP-REGISTRATIONS       #x00080000)
(defconstant     CBF-SKIP-UNREGISTRATIONS     #x00100000)
(defconstant     CBF-SKIP-DISCONNECTS         #x00200000)
(defconstant     CBF-SKIP-ALLNOTIFICATIONS    #x003c0000)

(defconstant     APPCMD-CLIENTONLY            #x00000010)
(defconstant     APPCMD-FILTERINITS           #x00000020)
(defconstant     APPCMD-MASK                  #x00000FF0)

(defconstant     APPCLASS-STANDARD            #x00000000)
(defconstant     APPCLASS-MASK                #x0000000F)

(defconstant     MF-HSZ-INFO                  #x01000000)
(defconstant     MF-SENDMSGS                  #x02000000)
(defconstant     MF-POSTMSGS                  #x04000000)
(defconstant     MF-CALLBACKS                 #x08000000)
(defconstant     MF-ERRORS                    #x10000000)
(defconstant     MF-LINKS                     #x20000000)
(defconstant     MF-CONV                      #x40000000)

(defconstant     MF-MASK                      #xFF000000)


;**** transaction types *****/

(defconstant     XTYPF-NOBLOCK            #x0002) ; CBR-BLOCK will not work */
(defconstant     XTYPF-NODATA             #x0004)  ; DDE-FDEFERUPD */
(defconstant     XTYPF-ACKREQ             #x0008)  ; DDE-FACKREQ */

(defconstant     XCLASS-MASK              #xFC00)
(defconstant     XCLASS-BOOL              #x1000)
(defconstant     XCLASS-DATA              #x2000)
(defconstant     XCLASS-FLAGS             #x4000)
(defconstant     XCLASS-NOTIFICATION      #x8000)

(defconstant     XTYP-ERROR             (logior #x0000  XCLASS-NOTIFICATION  XTYPF-NOBLOCK ))
(defconstant     XTYP-ADVDATA           (logior #x0010  XCLASS-FLAGS         ))
(defconstant     XTYP-ADVREQ            (logior #x0020  XCLASS-DATA  XTYPF-NOBLOCK ))
(defconstant     XTYP-ADVSTART          (logior #x0030  XCLASS-BOOL          ))
(defconstant     XTYP-ADVSTOP           (logior #x0040  XCLASS-NOTIFICATION))
(defconstant     XTYP-EXECUTE           (logior #x0050  XCLASS-FLAGS         ))
(defconstant     XTYP-CONNECT           (logior #x0060  XCLASS-BOOL  XTYPF-NOBLOCK))
(defconstant     XTYP-CONNECT-CONFIRM   (logior #x0070  XCLASS-NOTIFICATION  XTYPF-NOBLOCK))
(defconstant     XTYP-XACT-COMPLETE     (logior #x0080  XCLASS-NOTIFICATION  ))
(defconstant     XTYP-POKE              (logior #x0090  XCLASS-FLAGS         ))
(defconstant     XTYP-REGISTER          (logior #x00A0  XCLASS-NOTIFICATION  XTYPF-NOBLOCK))
(defconstant     XTYP-REQUEST           (logior #x00B0  XCLASS-DATA          ))
(defconstant     XTYP-DISCONNECT        (logior #x00C0  XCLASS-NOTIFICATION  XTYPF-NOBLOCK))
(defconstant     XTYP-UNREGISTER        (logior #x00D0  XCLASS-NOTIFICATION  XTYPF-NOBLOCK))
(defconstant     XTYP-WILDCONNECT       (logior #x00E0  XCLASS-DATA  XTYPF-NOBLOCK))

(defconstant     XTYP-MASK                #x00F0)
(defconstant     XTYP-SHIFT               4)  ; shift to turn XTYP- into an index */

;; Dde errors
(defconstant     DMLERR-NO-ERROR                    0)       ; must be 0 */

(defconstant     DMLERR-FIRST                       #x4000)

(defconstant     DMLERR-ADVACKTIMEOUT               #x4000)
(defconstant     DMLERR-BUSY                        #x4001)
(defconstant     DMLERR-DATAACKTIMEOUT              #x4002)
(defconstant     DMLERR-DLL-NOT-INITIALIZED         #x4003)
(defconstant     DMLERR-DLL-USAGE                   #x4004)
(defconstant     DMLERR-EXECACKTIMEOUT              #x4005)
(defconstant     DMLERR-INVALIDPARAMETER            #x4006)
(defconstant     DMLERR-LOW-MEMORY                  #x4007)
(defconstant     DMLERR-MEMORY-ERROR                #x4008)
(defconstant     DMLERR-NOTPROCESSED                #x4009)
(defconstant     DMLERR-NO-CONV-ESTABLISHED         #x400a)
(defconstant     DMLERR-POKEACKTIMEOUT              #x400b)
(defconstant     DMLERR-POSTMSG-FAILED              #x400c)
(defconstant     DMLERR-REENTRANCY                  #x400d)
(defconstant     DMLERR-SERVER-DIED                 #x400e)
(defconstant     DMLERR-SYS-ERROR                   #x400f)
(defconstant     DMLERR-UNADVACKTIMEOUT             #x4010)
(defconstant     DMLERR-UNFOUND-QUEUE-ID            #x4011)

(defconstant     DMLERR-LAST                        #x4011)

; DDE constants for wStatus field */

(defconstant DDE-FACK                #x8000)
(defconstant DDE-FBUSY               #x4000)
(defconstant DDE-FDEFERUPD           #x4000)
(defconstant DDE-FACKREQ             #x8000)
(defconstant DDE-FRELEASE            #x2000)
(defconstant DDE-FREQUESTED          #x1000)
(defconstant DDE-FAPPSTATUS          #x00ff)
(defconstant DDE-FNOTPROCESSED       #x0000)

; DDE name service constants

(defconstant DNS-REGISTER        #x0001)
(defconstant DNS-UNREGISTER      #x0002)
(defconstant DNS-FILTERON        #x0004)
(defconstant DNS-FILTEROFF       #x0008)

(defconstant cp-winansi 1004)
(defconstant cp-unicode 1200)
