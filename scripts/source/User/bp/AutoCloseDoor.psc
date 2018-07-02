ScriptName bp:AutoCloseDoor extends ObjectReference Const
{This script is used to automatically close and optionally lock a door after a configuratble period of time.}

;-- Properties --------------------------------------
float Property iWait = 5.0 Auto Const
{ How long to wait before closing the door? }
bool Property bLock = False Auto Const
{ Do you want the door to lock again after it closes? }

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnTimer(int aiTimerID)
	Self.SetOpen(False)
	If (bLock == True)
		Self.Lock(True, False)
	EndIf
EndEvent

Event OnOpen(ObjectReference akActorRef)
	Self.StartTimer(iWait, 0)
EndEvent
