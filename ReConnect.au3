#include <MsgBoxConstants.au3>
#include <NativeWifi.au3>
#include <Date.au3>
#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

$t = 0
$count =0 
$flipflop = false
$msg = ''
;$logsave = 0
While 1 <= 10
sleep($t)
$i = Ping("www.google.com")
if ($i > 0) then
   $t = 60000
   $count = 0
   ;$logsave = 0
	;if ($flipflop = false) then
	;		$msg = 'Connected'
;	endif

Else
   $count + 1
   $t = 6000 + ($count*1000)
   run ("C:\Program Files\Cmd Line\reconnect.bat","",@SW_HIDE)
   ;if ($logsave = 6)   then 
   ;$logsave = 0
   ;$flipflop = false
   ;endif
   ;$logsave + 1
   $msg = 'Disconnected'
   

EndIf
;if($flipflop = false) then
;		$flipflop = true
		$tCur = _Date_Time_GetSystemTime()
		FileOpen("log.cvs")
		
		FileWriteLine("log.cvs",_Date_Time_SystemTimeToDateTimeStr($tCur)&"," & $msg)
		FileClose("log.cvs")
;	endif
WEnd
